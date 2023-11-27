function binary_sequence = imageToBinary(image_path)
    % Charger une image
    image = imread(image_path);
    imshow (image)

    % Convertir l'image en niveaux de gris si elle est en couleur
    if size(image, 3) == 3
        image = rgb2gray(image);
        image = imresize(image, [30 30]);
        img = imcomplement(image);
        imshow(img)
    end

    % Convertir l'image en une suite binaire
    %binary_sequence = reshape(dec2bin(img(:), 8).' - '0', 1, []);
     binary_sequence = reshape(img, 1, 900);
end
