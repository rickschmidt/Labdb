# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111127011620) do

  create_table "dnasamples", :force => true do |t|
    t.string   "dna_accession"
    t.string   "dnasample_number"
    t.date     "date"
    t.string   "method"
    t.float    "first_elution_volume"
    t.string   "second_elute"
    t.float    "second_elution_volume"
    t.string   "reextracted"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_collected"
    t.string   "specimen_gender"
    t.integer  "collector_number"
    t.text     "extraction_notes"
    t.string   "museum"
    t.string   "sample_type"
  end

  create_table "dnasamples_genes", :id => false, :force => true do |t|
    t.integer  "dnasample_id"
    t.integer  "gene_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dnasamples_pcrs", :id => false, :force => true do |t|
    t.integer  "dnasample_id"
    t.integer  "pcr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dnasamples_projects", :id => false, :force => true do |t|
    t.integer  "dnasample_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dnasamples_taxonomies", :id => false, :force => true do |t|
    t.integer  "dnasample_id"
    t.integer  "taxonomy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genes", :force => true do |t|
    t.string   "genbank"
    t.string   "locus"
    t.string   "primerl"
    t.string   "primerh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "primer"
  end

  create_table "pcrs", :force => true do |t|
    t.string   "pcr_tube_number"
    t.string   "gel_image"
    t.date     "date"
    t.float    "anneal_temp"
    t.float    "dna_amount"
    t.string   "conditions"
    t.integer  "total_samples"
    t.string   "notes"
    t.string   "reamp"
    t.integer  "total_worked"
    t.float    "denature"
    t.float    "extension"
    t.float    "cycle"
    t.string   "primerl"
    t.string   "primerh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "success"
    t.boolean  "ready"
    t.string   "h2o"
    t.string   "buffer"
    t.string   "mgcl2"
    t.string   "bsa"
    t.string   "dntps"
    t.string   "taq"
  end

  create_table "pcrs_projects", :id => false, :force => true do |t|
    t.integer  "project_id"
    t.integer  "pcr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "primers", :force => true do |t|
    t.string   "primerh"
    t.string   "primerl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "sequence"
    t.string   "h2o"
    t.string   "buffer"
    t.string   "mgcl2"
    t.string   "bsa"
    t.string   "dntps"
    t.string   "taq"
  end

  create_table "projects", :force => true do |t|
    t.date     "date"
    t.float    "anneal"
    t.float    "dna_amount"
    t.integer  "total_samples"
    t.string   "notes"
    t.string   "project_name"
    t.string   "bsa"
    t.string   "buffer"
    t.string   "mgcl2"
    t.string   "taq"
    t.string   "h2o"
    t.string   "dntps"
    t.string   "dna"
    t.float    "primerl_amount"
    t.float    "primerh_amount"
    t.integer  "total"
    t.string   "primerl"
    t.string   "primerh"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxonomies", :force => true do |t|
    t.string   "genus"
    t.string   "species"
    t.string   "subspecies"
    t.string   "new_diagnosis"
    t.string   "family"
    t.string   "reference"
    t.string   "description_pdf"
    t.string   "synonyms"
    t.string   "type_museum"
    t.string   "distribution"
    t.string   "ingroup"
    t.string   "other_literature"
    t.string   "character_diagnosis"
    t.string   "description"
    t.string   "countries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
