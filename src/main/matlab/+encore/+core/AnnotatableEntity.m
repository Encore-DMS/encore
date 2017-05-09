classdef AnnotatableEntity < encore.core.Entity
    
    properties
    end
    
    methods
        
        function obj = AnnotatableEntity(cobj)
            obj@encore.core.Entity(cobj);
        end
        
        function addProperty(obj, key, value)
            obj.tryCore(@()obj.cobj.addProperty(key, obj.propertyValueFromValue(value)));
        end
        
        function removeProperty(obj, key)
            obj.tryCore(@()obj.cobj.removeProperty(key));
        end
        
        function m = getProperties(obj)
            m = [];
        end
        
        function m = getProperty(obj, key)
            m = [];
        end
        
        function v = getUserProperty(obj, user, key)
            v = [];
        end
        
        function m = getUserProperties(obj, user)
            m = [];
        end
        
        function addKeyword(obj, keyword)
            obj.tryCore(@()obj.cobj.addKeyword(keyword));
        end
        
        function removeKeyword(obj, keyword)
            obj.tryCore(@()obj.cobj.removeKeyword(keyword));
        end
        
        function m = getKeywords(obj)
            m = [];
        end
        
        function k = getAllKeywords(obj)
            k = [];
        end
        
        function k = getUserKeywords(obj, user)
            k = [];
        end
        
        function addNote(obj, time, text)
            
        end
        
        function removeNote(obj, note)
            
        end
        
        function m = getNotes(obj)
            m = [];
        end
        
        function n = getAllNotes(obj)
            n = [];
        end
        
        function n = getUserNotes(obj, user)
            n = [];
        end
        
    end
    
end

