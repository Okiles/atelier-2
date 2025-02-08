const DIRECTUS_URL = "/api";

const request = async (endpoint, method = "GET") => {
  try {
    const response = await fetch(`${DIRECTUS_URL}${endpoint}`, {
      method,
      headers: {
        "Content-Type": "application/json",
      },
      credentials: 'include',
      mode: 'cors'
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error("Erreur API:", error);
    throw error;
  }
};


// Lister les catégories
const listCategoriesUnfiltered = () => request("/items/lieux?fields=categorie");

// Récupérer l'id d'un lieu par catégorie
const getIdByTheme = (categorie) => {
  const params = new URLSearchParams({
    'filter[categorie][_eq]': categorie,
    fields: 'id',
  });
  return request(`/items/lieux?${params}`);
};

//Recupere la longitude d'une image avec l'id du lieu
const getImageLongitudeByIdLieux = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=longitude');
}

//Recupere la latitude d'une image avec l'id du lieu
const getImageLatitudeByIdLieux = (id) => {
  return request('/items/lieux?filter[id][_eq]='+id+'&fields=latitude');
}

// Récupérer nom, ville et coordonnées d'un lieu
const getLieuDetails = (id) => {
  return request(`/items/lieux?filter[id][_eq]=${id}&fields=nom,ville,latitude,longitude`);
};

// Récupérer l'id de l'image d'un lieu
const getIdImagesByIdLieux = (id) => {
  return request(`/items/lieux?filter[id][_eq]=${id}&fields=photo.directus_files_id`);
};

// Récupérer la photo d'un lieu avec son id
const getImage = (id) => request(`/assets/${id}`);

export { getImage, getIdImagesByIdLieux, getIdByTheme, getImageLatitudeByIdLieux, getImageLongitudeByIdLieux, getLieuDetails, listCategoriesUnfiltered };
