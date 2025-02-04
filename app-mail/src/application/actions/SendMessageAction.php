<?php

namespace geoquizz\mail\application\actions;

use PhpAmqpLib\Connection\AMQPStreamConnection;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use PhpAmqpLib\Message\AMQPMessage;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class SendMessageAction extends AbstractAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface {
        try {
            $data = $rq->getParsedBody();
            $messageText = $data['message'] ?? 'Hello World!';
            $email = $data['email'] ?? 'anon@geoquizz.com';
            $subject = $data['subject'] ?? 'Notification';

            $connection = new AMQPStreamConnection('rabbitmq', 5672, 'guest', 'guest');
            $channel = $connection->channel();
            $channel->queue_declare('my_queue', false, false, false, false);

            $msg = new AMQPMessage($messageText);
            $channel->basic_publish($msg, '', 'my_routing_key');

            $channel->close();
            $connection->close();

            $this->sendMail($messageText, $email, $subject);

            $rs->getBody()->write("Message sent");
        } catch (\Exception $e) {
            $rs->getBody()->write("Error: " . $e->getMessage());
        }

        return $rs;
    }

    private function sendMail(string $messageText, string $email, string $subject): void {
        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();
            $mail->Host = 'mailcatcher';
            $mail->Port = 1025;
            $mail->SMTPAuth = false;
            $mail->SMTPSecure = false;

            $mail->setFrom('no-reply@geoquizz.com', 'GeoQuizz');
            $mail->addAddress($email);
            $mail->Subject = $subject;
            $mail->Body = $messageText;

            $mail->send();
        } catch (Exception $e) {
            error_log("Mail Error: " . $mail->ErrorInfo);
        }
    }
}
