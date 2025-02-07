const DIRECTUS_URL = "http://localhost:42058";

const request = async (
  endpoint,
  method = 'GET',
) => {
  try {
    const response = await fetch(`${DIRECTUS_URL}${endpoint}`, { method });
    if (!response.ok) {
      throw new Error('Erreur lors de la requête vers Directus');
    }
    return await response.json();
  } catch (error) {
    console.error('Erreur API:', error);
    throw error;
  }
}

// Récupérer l'id d'un lieux avec sa catégorie         RETURN UNE LISTE DE 10 ID
const getIdByTheme = (categorie) => {
  return request('/items/lieux?filter[categorie][_eq]='+categorie+'&fields=id');
}

//Recupere la longitude d'une image avec l'id du lieu
const getImageLongitudeByIdLieux = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=longitude');
}

//Recupere la latitude d'une image avec l'id du lieu
const getImageLatitudeByIdLieux = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=latitude');
}

// Recuperer la ville d'un lieu avec son id
const getVilleById = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=ville');
}

// Recuperer le nom d'un lieu avec son id
const getNomById = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=nom');
}




//Récuperer l'id de l'image avec l'id du lieu
const getIdImagesByIdLieux = (id) => {
  return request('items/lieux?filter[id][_eq]='+id+'&fields=photo.directus_files_id');
}

// Récupérer la photo d'un lieu avec son id
const getImage = (id) => {
  return request('/assets/'+id);
}
export { getImage, getIdImagesByIdLieux, getIdByTheme, getImageLongitudeByIdLieux, getImageLatitudeByIdLieux, getVilleById, getNomById };
