module Spree
  class KitTaxon < Spree::Base
    self.table_name = "spree_kits_taxons"


    belongs_to :kit, class_name: "Spree::Kit"
    belongs_to :taxon, class_name: "Spree::Taxon", foreign_key: "taxon_id"



  end
end

