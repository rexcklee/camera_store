ActiveAdmin.register Product do
  menu priority: 3

  permit_params :name, :description, :price_cents, :category_id, :brand_id, :stock_quantity, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(:large_img), style: "height:300px") : ""
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :category
    column :brand
    column :description
    column "Price" do |product|
      number_to_currency product.price_cents/100.0
    end
    column :stock_quantity
    column :created_at
    column :updated_at
    column "Image" do |product|
      product.image.present? ? image_tag(product.image.variant(:thumb), style: "height:50px") : ""
    end
    actions
  end
end
