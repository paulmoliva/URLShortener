class AddIndicesToShorturl < ActiveRecord::Migration
  def change
    add_index :shortened_urls, :long_url
    add_index :shortened_urls, :short_url
  end
end
