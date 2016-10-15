#include<bits/stdc++.h>

using namespace std;

int drugCnt = 50, streetCnt = 37, DosageFormCnt = 5, manufacturerCnt = 10, componentCnt = 15, labsCnt = 7, namesCnt = 27, warehouseCnt = 20,
distributorCnt = 9, warehouseDeliveryCnt = 28, warehouseDeliveryPartCnt = 39;

string drugsName[161] = {
"Adara's Rose",
"Adravil",
"Alprazaline",
"ALZ-112, ALZ-113",
"Ambrosia",
"Axelavier",
"Anabiotics",
"Anti-Ague",
"Antibiotic Gel (AKA Heal Jelly)",
"Antidote",
"Athsat",
"Aqua Cure",
"Aquasol",
"Batika Indica",
"Bio-mimetic gel",
"Bittamucin",
"Blaccine",
"Biofoam",
"Byphodine",
"Cancer dust",
"Caring",
"Carabonal",
"Catana",
"Celestial Wine",
"Chamalla extract",
"Charlanta",
"Chiquitolina, pastillas de",
"Cloveritol",
"Comanapracil",
"Cortexiphan",
"Counteragent",
"Cryostim",
"Damascus Rose (Amnesia potion)",
"Daylight",
"DC2",
"Dehalcynate",
"Dioxnyl",
"Doloxan",
"Digitalin",
"Dragon Sand",
"Dreamy Sleepy Nighty Snoozy Snooze",
"Dried Frog Pills",
"Dylar",
"Dypraxa",
"Elixir of life",
"Elixir of Long Life",
"Elyon's Water",
"Estus",
"Ether",
"Expectane",
"Fast-penta",
"Felicium",
"Flora-Flor",
"Flintstones Chewable Morphine",
"Flu Buddy",
"Focusyn",
"Formula 977",
"Fukitol",
"Gambutrol",
"Gels",
"Heal(ing) potion",
"Hibernol",
"Hourai Elixir",
"Hydra",
"Hydromel",
"Hydronium Bromide",
"Hydroxl",
"Hypnocil",
"Hyronalin",
"Imobatine",
"Inaprovaline",
"Interfectum",
"Isoprovalyn",
"Jamitol",
"Jammitin",
"Jet Antidote",
"JJ-180",
"Kallocain",
"Kalocin",
"Krayoxx",
"Lethe",
"Lithium dibromide",
"Lot 6",
"Masiform D",
"Med-X",
"Medicinal Compound",
"Medi-Gel",
"Mem",
"Mephisto",
"Metazine",
"Miracurall",
"Miseth",
"Monomate, Dimate, and Trimate",
"Morpha",
"Morphling",
"Nappien",
"Necrotech Serum",
"Nectar",
"Neodextraline solution",
"Neuropozyne",
"Nexus",
"Nine Flower Jade Dew Pill",
"Nomolestol",
"Novril",
"Nyquil Cold, Flu & AIDS",
"Oret",
"Panexa",
"Pasceline D",
"Phalanx",
"Phalanxifor",
"Phoenix Down",
"Phoenix Tears",
"Placiden",
"Plasmids",
"Plomox",
"Pressure Pill",
"Prexilin",
"Procrastin-X (phenalazidine slackahide)",
"Progenitorivox",
"Provasic (RDU-90)",
"Provolanaproxalidamine C",
"PX-41 Antidote",
"Pylene-50",
"Qualex",
"RadAway",
"Rad-X",
"Recolada virus",
"Relaxabrex",
"Repressitol",
"Retinax 5",
"Ritalout",
"Ryetalyn",
"Ryll",
"Semuta",
"Senzu Bean",
"Selenine",
"Serisone",
"Serum 114",
"Shinten",
"Skele-gro",
"Soft Green Echo Eyedrop Antidote",
"Soma",
"Sopor slime",
"Space Mead",
"Spectrox",
"Stabilliser",
"Starshade",
"Stim pack",
"Stim-pak",
"Sym-Bac",
"Telol",
"Tribonin",
"Triopenin",
"Turbolax",
"Tunivor's Nectar",
"Varatril",
"Vigors",
"Viopril",
"Xorax",
"Zombrex",
"Zydrate"
};


string streetName[38] = {
"Acanthia Way",
"Alleyway between Magnolia Crescent and Wisteria Walk",
"Bermondsey Wall",
"Charing Cross Road",
"Chislehurst Gardens",
"Church Lane",
"Downing Street",
"Drury Lane",
"Ephraim Lane",
"Erdbergstrasse",
"Grangers' Home: Heathgate, Hampstead",
"Grimmauld Place",
"High Street (Godric's Hollow)",
"High Street (Hogsmeade)",
"Horizont Alley",
"Laburnum Gardens",
"Lanes End",
"Magnolia Crescent",
"Magnolia Road",
"Make Street",
"North Street",
"Orchard Street",
"Pike Street",
"Privet Drive",
"Pudding Lane",
"Rose Street",
"Scotland Place",
"Shaftesbury Avenue",
"South Way",
"Spinners End",
"Tollington Way",
"Tottenham Court Road",
"Vauxhall Road",
"Victoria Embankment",
"West 24th Street",
"Whitehall",
"Wildbrook Crescent",
"Wisteria Walk"
};


string componentName[48] = {
"aqua pura",
"Aconite (Wolfsbane)",
"Acromantula venom",
"Adders Fork",
"Agrippa",
"Angels Trumpet",
"Antimony",
"Armadillo bile",
"Ashwinder egg",
"Asphodel",
"Baneberry",
"Bat blood",
"Bat spleen",
"Belladonna",
"Bezoar",
"Bicorn horn",
"Billywig sting",
"Billywig sting slime",
"Black beetle eye",
"Blind-worm's Sting",
"Blood",
"Boom Berry",
"Boomslang",
"Boomslang skin",
"Bouncing Spider Juice",
"Bubotuber pus",
"Bulbadox juice",
"Butterscotch",
"Cat hair",
"Caterpillar",
"Chinese Chomping Cabbage",
"Chizpurfle carapace",
"Cinnamon",
"Cockroach",
"Croakoa",
"Crocodile heart",
"Daisy",
"Dandelion root",
"Deadlyius",
"Death-Cap",
"Dittany",
"Doxy egg",
"Dragon blood",
"Dragon claw",
"Dragon dung",
"Dragon horn",
"Dragon liver",
"Dragonfly thorax"
};

string DosageFormName[11] = {
"tablet", 
"capsule", 
"syrops", 
"suspension", 
"syrup", 
"powder", 
"liquid", 
"solid crystals", 
"natural or herbal plant", 
"seed", 
"pastes"
};


string manufacturerNames[79] = {
"Octapharma",
"Okasa Pharma",
"Okopharm Nahrstoff",
"OM Pharma",
"OMRON",
"Once",
"Ontex",
"Oral-b",
"Oranienburger Pharmawerk",
"Organon",
"Orient Foods",
"Orling",
"Orpha Devel Handels-und Vertriebs GmbH",
"Ostpharm",
"Oxford Lab",
"Panacea Biotec",
"Panpharma",
"Paras Pharm",
"Parke-Davis",
"Parke-Davis/Goedeck",
"Pashupati",
"Pasteur Merieux",
"Pateon Inc",
"Paul Hauser Chepharin",
"Pennex Labs",
"Perry Malaysia",
"Pettens France Chimie",
"Pharm. Factory #6",
"Pharma Biagini",
"Pharma Nord",
"Pharma Plast",
"Pharma Riace Ltd",
"Pharma-Med",
"Pharmachim",
"Pharmachim (Novochim)",
"Pharmachim (Pharmacia AD)",
"Pharmachim (Sopharma)",
"Pharmachim (Troyapharm)",
"Pharmachim, NIHFI",
"Pharmacia",
"Pharmacia AD",
"Pharmacia and Upjohn",
"Pharmacia NV/SA",
"Pharmalife Research",
"Pharmascience",
"Pharmatech",
"Pharmaton",
"Pharmedge Life Science",
"Pharmimpex",
"Philips Avent",
"Philopharm",
"Phytopharm Klenka",
"Pierre Fabre",
"Plastchim",
"Plastod",
"Pleasure Latex Prod.",
"Plethico",
"Pliva-Lachema",
"Polfa",
"Poli",
"Polpharma",
"Primax",
"Pro Vista AG",
"Pro.Med.CS",	
"Probio Nutra Forte AS",
"Procter & Gamble",
"Productos Naturales de Canarias S.L.",
"Proimpex",	
"ProLab Diagnostics",	
"Promed Exports",	
"Promedica",	
"Propharma A/S",
"Protech Biosystems",
"PSI",
"PT Vonix Latexindo",
"PUR",
"Qixing",
"Queisser Pharma",
"Quimica Montpellier"
};

string labsName[19] = {
"Black Mesa Research Facility",
"Black Mesa East",
"Black Letter Labs",
"Aperture Science Laboratories",
"Gizmonic Institute",
"The Hanso Foundation",
"Characters of Sluggy Freelance#Hereti-Corp",
"Imagination Institute",
"Mittelos Bioscience",
"PACT Corporation",
"Northguard",
"Project Cadmus",
"Robinson HeathNuclear Utilisation Technology Centre",
"S.T.A.R. Labs",
"Umbrella Corporation",
"The Jeffersonian Institute",
"Biocyte Pharmaceuticals",
"NorBAC",
"The D.H.A.R.M.A. Initiative"
};

string names[27] = {
"SMITH",
"JOHNSON",
"WILLIAMS",
"JONES",
"BROWN",
"DAVIS",
"MILLER",
"WILSON",
"MOORE",
"TAYLOR",
"ANDERSON",
"THOMAS",
"JACKSON",
"WHITE",
"HARRIS",
"MARTIN",
"THOMPSON",
"GARCIA",
"MARTINEZ",
"ROBINSON",
"CLARK",	
"RODRIGUEZ",
"LEWIS",
"LEE",
"WALKER",
"HALL",
"ALLEN"
};

void genDosageForm() {
    random_shuffle(DosageFormName, DosageFormName + 11);
    printf("INSERT INTO DosageForm(id, name) VALUES\n");
    for (int i = 0; i < DosageFormCnt; ++i) {
        printf("    (%d, '%s')", i, DosageFormName[i].c_str());
        if (i + 1 < DosageFormCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

void genManufacturer() {
    random_shuffle(manufacturerNames, manufacturerNames + 79);
    printf("INSERT INTO Manufacturer(id, name) VALUES\n");
    for (int i = 0; i < manufacturerCnt; ++i) {
        printf("    (%d, '%s')", i, manufacturerNames[i].c_str());
        if (i + 1 < manufacturerCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

string genFormulaText() {
    string fl = "CHO";
    int len = rand() % 6 + 1;
    int let = 1;
    string res;
    for (int i = 0; i < len; ++i) {
        if (let == 1) {
            res += fl[rand()%3]; 
        } else {
            res += ('0' + (rand()%9 + 1));
        }
        let = rand()%2;
    }
    return res;
}

string genDateText() {
    string res;
    int day = rand() % 29 + 1;
    res += '0' + day/10;
    res += '0' + day%10;
    res += '/';
    int mn = rand() % 11 + 1;
    res += '0' + mn/10;
    res += '0' + mn%10;
    res += "/20";
    int yr = rand()%20;
    res += '0' + yr/10;
    res += '0' + yr%10;
    return res;
}

void genComponent() {    
    random_shuffle(componentName, componentName + 48);
    printf("INSERT INTO Component(id, name, formula) VALUES\n");
    for (int i = 0; i < componentCnt; ++i) {
        printf("    (%d, '%s', '%s')", i, componentName[i].c_str(), 
            genFormulaText().c_str());
        if (i + 1 < componentCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

void genLabs() {
    random_shuffle(labsName, labsName + 19);
    printf("INSERT INTO Laboratory(id, name, managerLastName) VALUES\n");
    for (int i = 0; i < labsCnt; ++i) {
        printf("    (%d, '%s', '%s')", i, labsName[i].c_str(), 
            names[rand()%namesCnt].c_str());
        if (i + 1 < labsCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

void genDrugs() {
    random_shuffle(drugsName, drugsName + 161);
    printf("INSERT INTO Drug(id, name, internationalName, dosageFormId, manufacturerId, componentId, certificateId, certificateExpires, certificateLaboratoryId) VALUES\n");
    for (int i = 0; i < drugCnt; ++i) {
        printf("    (%d, '%s', '%s', %d, %d, %d, %d, '%s', %d)", i,   drugsName[i].c_str(), drugsName[i].c_str(), 
             rand() % DosageFormCnt, 
             rand() % manufacturerCnt,
             rand() % componentCnt, 
             i, 
	     genDateText().c_str(), 
             rand() % labsCnt
 );
        if (i + 1 < drugCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

string genAdressText() {
    string res = streetName[rand()%streetCnt];
    res += ' ';
    int num = rand()%99 + 1;
    res += ('0' + num/10);
    res += ('0' + num%10);
    return res;
}

void genWarehouse() {
    printf("INSERT INTO Warehouse(id, address, number) VALUES\n");
    for (int i = 0; i < warehouseCnt; ++i) {
        printf("    (%d, '%s', %d)", 
        i,   genAdressText().c_str(),
        i);
        if (i + 1 < warehouseCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

string genBankAccountNumber() {
    string res = "SE45";
    for (int i = 0; i < 5; ++i) {
        res += ' ';
        for (int j = 0; j < 4; ++j) {
            res += '0' + rand()%10;
        }
    }
    return res;
}

string genPhone() {
    string res = "+7 ";
    for (int i = 0; i < 3; ++i) {
        res += '0' + rand()%10;
    }
    res += ' ';

    for (int i = 0; i < 3; ++i) {
        res += '0' + rand()%10;
    }
    res += ' ';

    for (int i = 0; i < 2; ++i) {
        res += '0' + rand()%10;
    }
    res += ' ';

    for (int i = 0; i < 2; ++i) {
        res += '0' + rand()%10;
    }
    return res;
}

void genDistributor() {
    printf("INSERT INTO Distributor(id, address, bankAccountNumber, contactName, contactPhoneNumber) VALUES\n");
    for (int i = 0; i < distributorCnt; ++i) {
        printf("    (%d, '%s', '%s', '%s', '%s')", 
        i,   genAdressText().c_str(),
         genBankAccountNumber().c_str(), 
        names[rand()%namesCnt].c_str(),
        genPhone().c_str());
        if (i + 1 < distributorCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}


void genWarehouseDelivery() {
    printf("INSERT INTO WarehouseDelivery(id, warehouseId, distributorId, deliveredAt, warehouseKeeper) VALUES\n");
    for (int i = 0; i < warehouseDeliveryCnt; ++i) {
        printf("    (%d, %d, %d, '%s', '%s')", 
        i,   rand()%warehouseCnt,
        rand()%distributorCnt, 
        genDateText().c_str(),
        names[rand()%namesCnt].c_str());
        if (i + 1 < warehouseDeliveryCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

void genWarehouseDeliveryPart() {
    printf("INSERT INTO WarehouseDeliveryPart(deliveryId, drugId, packageCount, packageWeight, itemsPerPackage, itemPurchasePrice) VALUES\n");
    for (int i = 0; i < warehouseDeliveryPartCnt; ++i) {
        printf("    (%d, %d, %d, %f, %d, %d)", 
        rand()%warehouseDeliveryCnt, 
        rand()%drugCnt, 
        rand()%100, 
        (rand()%20)*100*1., 
        rand()%100, 
        rand()%1000000000);
        if (i + 1 < warehouseDeliveryPartCnt) {
            printf(",\n");
        } else {
            printf(";\n\n");
        }
    }
}

int main() {
    freopen("inserts.sql", "w", stdout);
    srand(179);
    genDosageForm();
    genManufacturer();
    genComponent();
    genLabs();
    genDrugs();
    genWarehouse();
    genDistributor();
    genWarehouseDelivery();
    genWarehouseDeliveryPart();
}
