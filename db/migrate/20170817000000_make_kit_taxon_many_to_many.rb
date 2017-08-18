class MakeKitTaxonManyToMany < ActiveRecord::Migration

  def up

    create_table :spree_kits_taxons do |t|
      t.references :kit
      t.references :taxon
    end

     Spree::Kit.all.each do |k|
       k.lookbooks.each do |l|
         k.taxons << l.spree_taxon if l.spree_taxon
       end
        k.taxons << Spree::Taxon.find(k.spree_taxons_id) if k.spree_taxons_id
       k.save
     end

    remove_reference :spree_kits, :spree_taxons


  end

end