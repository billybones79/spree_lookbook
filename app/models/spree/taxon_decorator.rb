Spree::Taxon.class_eval do
  has_many :lookbooks,foreign_key: "spree_taxon_id"
  has_many :kits,foreign_key: "spree_taxons_id", class_name:"Spree::Kit"

end