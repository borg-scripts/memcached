module.exports = ->
  @then @install, 'memcached'

  @then @template, [__dirname, 'templates', 'default', 'memcached.conf'],
    to: '/etc/memcached.conf'
    user: 'root'
    group: 'root'
    sudo: true
    mode: '0644'
    local:
      memcached:
        memory: 64
        port:  11211
        user: 'memcache'
        listen: '127.0.0.1'
        maxconn: 1024
