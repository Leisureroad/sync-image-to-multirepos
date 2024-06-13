#!/bin/bash

locations=("asia-southeast1" "us-central1")
echo "_IMAGE_TAG ${_IMAGE_TAG}"
echo "LOCATION ${LOCATION}"
image_tag=${_IMAGE_TAG}
location=${LOCATION}
echo "image_tag $image_tag"
echo "location $location"

for new_loc in "${locations[@]}"
do
    echo "new_loc $new_loc"
    new_image_tag=${image_tag/#$location/$new_loc}   
    echo "new_image_tag $new_image_tag"
    if [ "${_IMAGE_TAG}" != $new_image_tag ]; then
      gcrane cp ${_IMAGE_TAG} $new_image_tag
    fi
done
