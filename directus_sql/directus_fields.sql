INSERT INTO "directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message") VALUES
(12,	'lieux',	'id',	NULL,	'input',	NULL,	NULL,	NULL,	't',	't',	1,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(13,	'lieux',	'categorie',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	2,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(14,	'lieux',	'longitude',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	3,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(15,	'lieux',	'latitude',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	4,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(16,	'lieux',	'ville',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	5,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(17,	'lieux',	'nom',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	6,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(18,	'lieux',	'photo',	'files',	'files',	NULL,	NULL,	NULL,	'f',	'f',	7,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(19,	'lieux_files',	'id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	1,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(20,	'lieux_files',	'lieux_id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	2,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(21,	'lieux_files',	'directus_files_id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	3,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL);
