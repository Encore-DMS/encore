classdef ExperimentSet < encore.core.collections.TimelineEntitySet
    
    properties
        purpose
    end
    
    methods
        
        function obj = ExperimentSet(experiments)
            obj@encore.core.collections.TimelineEntitySet(experiments);
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

