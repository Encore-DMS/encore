classdef EntitySet < encore.core.collections.ObjectSet
    
    properties
    end
    
    methods
        
        function obj = EntitySet(entities)
            if nargin < 1 || isempty(entities)
                entities = {};
            end
            obj@encore.core.collections.ObjectSet(entities);
        end
        
        function t = getEntityType(obj)
            t = [];
            if ~isempty(obj.objects) && all(cellfun(@(e)isequal(e.getEntityType(), obj.objects{1}.getEntityType()), obj.objects))
                t = obj.objects{1}.getEntityType();
            end
        end
        
    end
    
end

