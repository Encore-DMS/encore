classdef Signal < encore.core.ResourceAnnotatableEntity
    
    properties (SetAccess = private)
        epoch
        device
        units
    end
    
    methods
        
        function obj = Signal(cobj)
            obj@encore.core.ResourceAnnotatableEntity(cobj);
        end
        
        function e = get.epoch(obj)
            e = encore.core.Epoch(obj.cobj.getEpoch());
        end
        
        function d = get.device(obj)
            d = encore.core.Device(obj.cobj.getDevice());
        end
        
        function u = get.units(obj)
            u = char(obj.cobj.getUnits());
        end
        
    end
    
end

