# Pagy initializer file (6.4.0)
# Customize only what you really need but notice that the core Pagy works also without any of the following lines.
# Should you just cherry pick part of this file, please maintain the require-order of the extras

# Pagy DEFAULT Variables
# See https://ddnexus.github.io/pagy/docs/api/pagy#variables
# All the Pagy::DEFAULT are set for all the Pagy instances but can be overridden per instance by just passing them to
# Pagy.new|Pagy::Countless.new|Pagy::Calendar::*.new or any of the #pagy* controller methods

# Instance variables
# See https://ddnexus.github.io/pagy/docs/api/pagy#instance-variables
Pagy::DEFAULT[:items] = 10        # items per page
Pagy::DEFAULT[:size]  = 9 # nav bar links
# Pagy::DEFAULT[:page_param] = :page    # page param name
# Pagy::DEFAULT[:params] = {}           # params for url
# Pagy::DEFAULT[:fragment] = '#fragment'    # arbitrary fragment string
# Pagy::DEFAULT[:link_extra] = 'data-remote="true"' # extra attributes for links
# Pagy::DEFAULT[:i18n_key] = 'pagy.item_name'       # i18n key
# Pagy::DEFAULT[:cycle] = true              # cycle on next/prev keys

# Extras
# See https://ddnexus.github.io/pagy/docs/extras

# Backend Extras

# Array extra: Paginate arrays efficiently, avoiding expensive array-wrapping and without overriding
# See https://ddnexus.github.io/pagy/docs/extras/array
# require 'pagy/extras/array'

# Calendar extra: Add pagination filtering by calendar time unit (year, quarter, month, week, day)
# See https://ddnexus.github.io/pagy/docs/extras/calendar
# require 'pagy/extras/calendar'

# Countless extra: Paginate without any count, saving one query per rendering
# See https://ddnexus.github.io/pagy/docs/extras/countless
# require 'pagy/extras/countless'

# Elasticsearch Rails extra: Paginate `ElasticsearchRails::Results` objects
# See https://ddnexus.github.io/pagy/docs/extras/elasticsearch_rails
# require 'pagy/extras/elasticsearch_rails'

# Headers extra: http response headers (and other helpers) useful for API pagination
# See http://ddnexus.github.io/pagy/docs/extras/headers
# require 'pagy/extras/headers'

# Meilisearch extra: Paginate `Meilisearch` result objects
# See https://ddnexus.github.io/pagy/docs/extras/meilisearch
# require 'pagy/extras/meilisearch'

# Metadata extra: Provides the pagination metadata to Javascript frameworks like Vue.js, react.js, etc.
# See https://ddnexus.github.io/pagy/docs/extras/metadata
# require 'pagy/extras/metadata'

# Searchkick extra: Paginate `Searchkick::Results` objects
# See https://ddnexus.github.io/pagy/docs/extras/searchkick
# require 'pagy/extras/searchkick'

# Frontend Extras

# Bootstrap extra: Add nav, nav_js and combo_nav_js helpers and templates for Bootstrap pagination
# See https://ddnexus.github.io/pagy/docs/extras/bootstrap
# require 'pagy/extras/bootstrap'

# Bulma extra: Add nav, nav_js and combo_nav_js helpers and templates for Bulma pagination
# See https://ddnexus.github.io/pagy/docs/extras/bulma
# require 'pagy/extras/bulma'

# Foundation extra: Add nav, nav_js and combo_nav_js helpers and templates for Foundation pagination
# See https://ddnexus.github.io/pagy/docs/extras/foundation
# require 'pagy/extras/foundation'

# Materialize extra: Add nav, nav_js and combo_nav_js helpers and templates for Materialize pagination
# See https://ddnexus.github.io/pagy/docs/extras/materialize
# require 'pagy/extras/materialize'

# Navs extra: Add nav_js and combo_nav_js javascript helpers
# Notice: the other frontend extras add their own framework-styled versions,
# so require this extra only if you need the unstyled version
# See https://ddnexus.github.io/pagy/docs/extras/navs
# require 'pagy/extras/navs'

# Semantic extra: Add nav, nav_js and combo_nav_js helpers and templates for Semantic UI pagination
# See https://ddnexus.github.io/pagy/docs/extras/semantic
# require 'pagy/extras/semantic'

# UIkit extra: Add nav, nav_js and combo_nav_js helpers and templates for UIkit pagination
# See https://ddnexus.github.io/pagy/docs/extras/uikit
# require 'pagy/extras/uikit'

# Multi size var used by the *_nav_js helpers
# See https://ddnexus.github.io/pagy/docs/extras/navs#steps
# Pagy::DEFAULT[:steps] = { 0 => [2,3,3,2], 540 => [3,5,5,3], 720 => [5,7,7,5] }

# Feature Extras

# Gearbox extra: Automatically change the number of items per page depending on the page number
# See https://ddnexus.github.io/pagy/docs/extras/gearbox
# require 'pagy/extras/gearbox'

# Items extra: Allow the client to request a custom number of items per page with an optional selector UI
# See https://ddnexus.github.io/pagy/docs/extras/items
# require 'pagy/extras/items'

# Overflow extra: Allow for easy handling of overflowing pages
# See https://ddnexus.github.io/pagy/docs/extras/overflow
# require 'pagy/extras/overflow'

# Support extra: Extra support for features like: incremental, infinite, auto-scroll pagination
# See https://ddnexus.github.io/pagy/docs/extras/support
# require 'pagy/extras/support'

# Trim extra: Remove the page=1 param from links
# See https://ddnexus.github.io/pagy/docs/extras/trim
# require 'pagy/extras/trim'

# Standalone extra: Use pagy in non Rack environment/gem
# See https://ddnexus.github.io/pagy/docs/extras/standalone
# require 'pagy/extras/standalone'

# Rails

# I18n
# See https://ddnexus.github.io/pagy/docs/api/frontend#i18n

# require 'pagy/extras/i18n'

# or for edge rails (pagy 6.0+)
# require 'pagy/extras/rails'

# When you are done setting your own default freeze it, so it will not get changed accidentally
Pagy::DEFAULT.freeze
