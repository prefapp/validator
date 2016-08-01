require 'yaml'

# PREDEFINED_VALIDATIONS = YAML.load_file("#{Rails.root.to_s}/config/predefined_validations.yml")
PREDEFINED_VALIDATIONS = {
    # tipos generales
    "int" => {"regex" => /^\d+$/},
    "signed_int" => {"regex" => /^[-+]?\d+$/},
    "float" => {"regex" => /\A[+-]?\d+\.?\d+(e[+-]?\d+)?\z/i},
    "text" => {"regex" => /^[@%\s\w\-]+$/i}, #texto nunha soa linea (palabras con espacio, _, -, @ e %)
    "multiline_text" => {"regex" => /^[\w\-\_\@\s\.\,]+/i}, 
    "word" => {"regex" => /\A[\w\-]+\z/i}, #solo unha palabra
    
    # tipos especificos
    "email" => {"regex" => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
    "username" => {"regex" => /\A[\w\-]+\z/i},
    "password" => {"regex" => /^.{6,64}$/},
    "domain" => {"regex" => /^(default|[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,}))$/}, 
    "server_name" => {"regex" => /^(localhost|([a-z0-9-]+|\*)(\.([a-z0-9-]+|\*))*(\.([a-z]{2,}|\*)))$/},
    "host" => {"regex" =>  /\A(localhost|[a-z\d\-.]+\.[a-z]+)\z/i},
    "ipv4" => {"regex" => /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/},
    "url" => {
        "regex" => /^(http(s)?|ftp|ssh):\/\/(([\w\-\:]+)\@)?(([A-Za-z0-9-]+\.)*([A-Za-z0-9-]+\.[A-Za-z0-9]+))+((\/?)(([A-Za-z0-9\._\-]+)(\/){0,1}[A-Za-z0-9.-\/]*)){0,1}/
    },
    'smtp_user' => {
        'regex' => /
            ^(
                ([\w+\-.]+@[a-z\d\-.]+\.[a-z]+) | # email
                ([\w\-\_]+)                       # username
            )$/x
    },
    "revision" => {"regex" => /\A[\w.\-_]+\z/},
    "unix_path" => {"regex" =>  /^[\w\s.\/\-_+%]+$/i },
    "unix_command" => {"regex" => /\A[\w\s.\-_+><:]+\z/i }, 
    "tcp_port" => {"range" =>  "1..65535" },
    "mysql_dbname" => {"regex" => /\A[a-z0-9_]{2,63}\z/i} ,
    "mysql_dbuser" => {"regex" => /\A[a-z0-9_]{2,16}\z/i},
    "mysql_dbpassword" => {"regex" => /\A.{6,64}\z/i},
    "db_password" => {"regex" => /^.{6,64}$/i},

    "postgresql_identifier" => {"regex" => /\A[a-z0-9_]{2,63}\z/i} ,
    "postgresql_extra_privileges" => {
        "regex" => /^
            (
                SUPERUSER | NOSUPERUSER |
                CREATEDB | NOCREATEDB |
                CREATEROLE | NOCREATEROLE |
                CREATEUSER | NOCREATEUSER |
                INHERIT | NOINHERIT |
                LOGIN | NOLOGIN |
                CONNECTION LIMIT \d{1,4} |
                PASSWORD .{6,64} |
                VALID UNTIL \d{10,16}

            )$/x
    },
    
    "version" => {"regex" => /\A\w+\.\w+(\.\w+)?(\.\w+)?\z/},
    "package_name" => {"regex" => /^[a-z0-9+-.=]+$/}, # ver http://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Source
    "checksum" => {"regex" => /^[a-z0-9]{16,64}$/i},
    "command_line_option" => {"regex" => /^[\w\-\:\.\/]*$/},
    "perl_module" => {"regex" => /^\w+(\:\:\w+)*(\@[0-9.-_]+)?$/},
    "node_module" => {"regex" => /^[\w\.-]+$/},
    "ruby_gem" => {"regex" =>  /^[\w\-\.#]+$/},
    "python_package" => {"regex" =>  /^[\w\-\.#]+$/},

    "socket_address" => {"regex" => /^(unix|tcp|udp)?(\:\/\/)?[\/\w\.\d\:_-]+?\:?\d{0,5}$/},
    "git_bundle" => {
        "regex" => 
            /^
            [\w\s.\/\-_+%]+ # unix_path
            \|
            ([a-z\-_]+\:\/\/)?[a-z\d\-.@]+\.[a-z\d\-.:]+\/[^\|]+  # url
            \|
            [\w.\-_]+  # revision
            (\|[\w\s.\/\-_+%,]+)? # file list (optional)
            $/x
    },
    "apache_module" => {
        "fixed_values" => 
            [ 
                "alias", "apreq2", "auth_basic", "auth_digest", "authn_file","authn_core","authnz_ldap", 
                "auth_openid", "authz_default", "authz_groupfile", "authz_host", "authz_user", "autoindex", 
                "cgi", "dav_fs", "dav", "dav_svn", "deflate", "dir", "env", "expires", "fcgid", "headers", "ldap", 
                "log_config", "logio", "mime", "negotiation", "perl", "php5", "proxy_ajp", "proxy_balancer",
                "proxy_connect", "proxy_http", "proxy", "python", "rewrite", "setenvif", "ssl", "status", "wsgi", 
                "xsendfile", "access_compat"
            ],
    },
    "iso639-1" => {
        "regex" => /^[a-z]{2}$/i
    },
    "ssh_public_key" => {"regex" => /^[@%\s\w\/\+\-\.]+$/i},
}

puts YAML.dump(PREDEFINED_VALIDATIONS)
