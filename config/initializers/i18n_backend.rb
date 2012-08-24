# Create redis as a global
$redis = Redis.new()
I18n.backend = I18n::Backend::KeyValue.new($redis)
