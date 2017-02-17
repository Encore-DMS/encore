classdef EpochBlockSet < encore.core.collections.TimelineEntitySet
    
    properties (SetAccess = private)
        protocolId
    end
    
    methods
        
        function obj = EpochBlockSet(blocks)
            obj@encore.core.collections.TimelineEntitySet(blocks);
        end
        
        function i = get.protocolId(obj)
            i = '';
            if ~isempty(obj.objects) && all(cellfun(@(s)isequal(s.protocolId, obj.objects{1}.protocolId), obj.objects))
                i = obj.objects{1}.protocolId;
            end
        end
        
    end
    
end

