PuppetLint.new_check(:resource_outside_class) do
  def check

    first_token = tokens.first
    last_token = tokens.last
    resource_list = resource_indexes

    if class_indexes.length > 0
      # The file has at least a class in it it
      class_list = class_indexes
      
      class_list.each do |cl|
        resource_list.each do |res|
          unless ( res[:start] > cl[:start] ) && ( res[:end] < cl[:end] )
            notify :warning,  {
              :message => 'resource found outside a class definition',
              :line    => res[:type].line,
              :column  => res[:type].column,
            }
          end
        end
      end

    elsif defined_type_indexes.length > 0
      #the file has at least a defined type in it
      define_list = defined_type_indexes
      
      define_list.each do |dl|
        resource_list.each do |res|
          unless ( res[:start] > dl[:start] ) && ( res[:end] < dl[:end] )
            notify :warning,  {
              :message => 'resource found outside a defined type defintion',
              :line    => res[:type].line,
              :column  => res[:type].column,
            }
          end
        end
      end
    else
      #no class and no defined type
      unless resource_list.length == 0
        notify :warning, {
          :message => 'resources exist but no class or defined type definition found in manifest',
          :line    => resource_list.first[:type].line,
          :column  => resource_list.first[:type].column,
        }
      end
    end
  end
end

