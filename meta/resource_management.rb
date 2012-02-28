class Resource

    def open
        puts "Opening the resource"
    end

    def do_something
        puts "Doing something"
    end

    def close
        puts "Closing the resource"
    end
end

module Kernel
    def using(resource)
        begin
            yield
        ensure
            resource.close
        end
    end
end

conn = Resource.new

using(conn) do
    conn.do_something
end