ActiveAdmin.register Product do
  menu priority: 3

  permit_params :name, :description, :price_cents, :category_id, :brand_id, :stock_quantity, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, style: "height:200px") : ""
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :category
    column :brand
    column :description
    column :price_cents
    column :stock_quantity
    column :created_at
    column :updated_at
    column "Image" do |product|
      product.image.present? ? image_tag(product.image, style: "height:100px") : ""
    end
    actions
  end
end
