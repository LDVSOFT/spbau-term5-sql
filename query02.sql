SELECT DISTINCT Laboratory.id, Laboratory.name
    FROM Laboratory 
        JOIN Drug ON Laboratory.id = Drug.certificateLaboratoryId
        JOIN Component ON Component.id = Drug.componentId
    WHERE 
        Component.name = 'aqua pura';
