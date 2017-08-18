Spree::Taxon.class_eval do
  has_many :lookbooks,foreign_key: "spree_taxon_id"
  has_many :spree_kits_taxons,  class_name: "Spree::KitTaxon"

  has_many :kits,:through => 'spree_kits_taxons', class_name: "Spree::Kit"

end