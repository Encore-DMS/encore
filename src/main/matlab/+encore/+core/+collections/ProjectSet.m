classdef ProjectSet < encore.core.collections.TimelineEntitySet
    
    properties
        name
        purpose
    end
    
    methods
        
        function obj = ProjectSet(projects)
            obj@encore.core.collections.TimelineEntitySet(projects);
        end
        
        function n = get.name(obj)
            n = '';
            if ~isempty(obj.objects) && all(cellfun(@(s)isequal(s.name, obj.objects{1}.name), obj.objects))
                n = obj.objects{1}.name;
            end
        end
        
        function set.name(obj, n)
            for i = 1:obj.size
                obj.get(i).name = n;
            end
        end
        
        function p = get.purpose(obj)
            p = '';
            if ~isempty(obj.objects) && all(cellfun(@(s)isequal(s.purpose, obj.objects{1}.purpose), obj.objects))
                p = obj.objects{1}.purpose;
            end
        end
        
        function set.purpose(obj, p)
            for i = 1:obj.size
                obj.get(i).purpose = p;
            end
        end
        
    end
    
end

