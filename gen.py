#!/usr/bin/python3

import random
import string

def rndstr():
    strlen = random.randint(1, 20)
    return ''.join(random.choice(string.ascii_letters) for _ in range(strlen))

def datestr():
    d = random.randint(1, 20);
    m = random.randint(1, 12);
    y = random.randint(2000, 2020);
    return ('%02d-%02d-%d' % (d, m, y))

f = open('largeinsert.sql', 'w')

dosageFormN = 100000
for i in range(dosageFormN):
    f.write("INSERT INTO DosageForm VALUES(%d, '%s');\n" %
            (i, rndstr())
    )

manufacturerN = 100000
for i in range(manufacturerN):
    f.write("INSERT INTO Manufacturer VALUES(%d, '%s');\n" %
            (i, rndstr())
    )

componentN = 100000
for i in range(componentN):
    f.write("INSERT INTO Component VALUES(%d, '%s', '%s');\n" %
            (i, rndstr(), rndstr())
    )

laboratoryN = 100000
for i in range(laboratoryN):
    f.write("INSERT INTO Laboratory VALUES(%d, '%s', '%s');\n" %
            (i, rndstr(), rndstr())
    )

drugN = 100000
for i in range(drugN):
    f.write("INSERT INTO Drug VALUES(%d, '%s', '%s', %d, %d, %d, %d, '%s', %d);\n" %
            (
                i
                , rndstr()
                , rndstr()
                , random.randint(0, dosageFormN-1)
                , random.randint(0, manufacturerN-1)
                , random.randint(0, componentN-1)
                , i
                , datestr()
                , random.randint(0, laboratoryN-1)
            )
    )

warehouseN = 100000
for i in range(warehouseN):
    f.write("INSERT INTO Warehouse VALUES(%d, '%s', %d);\n" %
            (i, rndstr(), i)
    )

distributorN = 100000
for i in range(distributorN):
    f.write("INSERT INTO Distributor VALUES(%d, '%s', '%s', '%s', '%s');\n" %
        (i, rndstr(), rndstr(), rndstr(), rndstr())
    )

warehouseDelivery = 100000
warehouseDeliveryPartN = 100000
for i in range(warehouseDelivery):
    f.write("INSERT INTO WarehouseDelivery VALUES(%d, %d, %d, '%s', '%s');\n" %
            (
                i
                , random.randint(0, warehouseN-1)
                , random.randint(0, distributorN-1)
                , datestr()
                , rndstr()
            )
    )
    f.write("INSERT INTO WarehouseDeliveryPart VALUES(%d, %d, %d, %d, %d, %d);\n" %
            (
                i
                , random.randint(0, drugN-1)
                , random.randint(0, 1000)
                , random.randint(0, 1000)
                , random.randint(1, 1000)
                , random.randint(0, 1000)
            )
    )

drugstoreN = 10000
for i in range(drugstoreN):
    f.write("INSERT INTO Drugstore VALUES(%d, '%s', %d);\n" %
            (
                i
                , rndstr()
                , i
            )
    )

drugsInDrugstore = 100000
for i in range(drugsInDrugstore):
    f.write("INSERT INTO DrugsInDrugstore VALUES(%d, %d, %d, %d);\n" %
            (
                random.randint(0, drugstoreN-1)
                , random.randint(0, drugN-1)
                , random.randint(0, 1000)
                , random.randint(0, 1000)
            )
    )

carN = 100000
for i in range(carN):
    f.write("INSERT INTO Car VALUES(%d, '%s', '%s');\n" %
            (
                i
                , rndstr()
                , datestr()
            )
    )

drugstoreDeliveryN = 100000
drugstoreDeliveryPartN = 100000
for i in range(drugstoreDeliveryN):
    f.write("INSERT INTO DrugstoreDelivery VALUES(%d, %d, '%s', %d);\n" %
            (
                i
                , random.randint(0, carN-1)
                , datestr()
                , random.randint(0, warehouseN-1)
            )
    )
    f.write("INSERT INTO DrugstoreDeliveryPart VALUES(%d, %d, %d, %d);\n" %
            (
                i
                , random.randint(0, drugN-1)
                , random.randint(0, drugstoreN-1)
                , random.randint(0, 1000)
            )
    )


f.close()
