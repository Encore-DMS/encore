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
            wrapValue = @(v)obj.mapFromJavaMap(v, @obj.valueFromPropertyValue);
            m = obj.mapFromJavaMap(obj.cobj.getProperties(), wrapValue, @(k)encore.core.User(k).username);
        end
        
        function m = getProperty(obj, key)
            m = obj.mapFromJavaMap(obj.cobj.getProperty(key), @obj.valueFromPropertyValue);
        end
        
        function v = getUserProperty(obj, user, key)
            v = obj.valueFromPropertyValue(obj.cobj.getUserProperty(user.cobj, key));
        end
        
        function m = getUserProperties(obj, user)
            m = obj.mapFromJavaMap(obj.cobj.getUserProperties(user.cobj), @obj.valueFromPropertyValue);
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

