module.exports = ->
  @then @install, 'memcached'

  @then @template, 'memcached.conf',
    to: '/etc/memcached.conf'
    owner: 'root'
    group: 'root'
    sudo: true
    mode: '0644'
    variables:
      memcached:
        memory: @server.memcached.memory or 64
        port: @server.memcached.port or 11211
        user: @server.memcached.user or 'memcache'
        listen: @server.memcached.listen or '127.0.0.1'
        maxconn: @server.memcached.maxconn or 1024
