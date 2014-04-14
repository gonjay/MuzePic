json.array!(@images) do |image|
  json.extract! image, :id, :img_src, :acv_comment, :width, :height, :size
  json.url image_url(image, format: :json)
end
