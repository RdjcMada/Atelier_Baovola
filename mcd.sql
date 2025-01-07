CREATE TABLE Marque(
   id_marque VARCHAR(50) ,
   label TEXT NOT NULL,
   PRIMARY KEY(id_marque)
);

CREATE TABLE Model(
   id_model VARCHAR(50) ,
   label TEXT NOT NULL,
   id_marque VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_model),
   FOREIGN KEY(id_marque) REFERENCES Marque(id_marque)
);

CREATE TABLE Client(
   id_client VARCHAR(50) ,
   email TEXT NOT NULL,
   first_name TEXT,
   number TEXT NOT NULL,
   PRIMARY KEY(id_client)
);

CREATE TABLE Service_type(
   id_service_type VARCHAR(50) ,
   label TEXT NOT NULL,
   price NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id_service_type)
);

CREATE TABLE composite_type(
   id_composite_type VARCHAR(50) ,
   label TEXT NOT NULL,
   PRIMARY KEY(id_composite_type)
);

CREATE TABLE mouvement_type(
   id_mouvement_type VARCHAR(50) ,
   label TEXT NOT NULL,
   PRIMARY KEY(id_mouvement_type)
);

CREATE TABLE Feeder(
   id_feeder VARCHAR(50) ,
   name_feeder TEXT NOT NULL,
   email TEXT NOT NULL,
   numbers TEXT NOT NULL,
   PRIMARY KEY(id_feeder)
);

CREATE TABLE Purchase_order(
   id_purchare_order VARCHAR(50) ,
   date_send DATE NOT NULL,
   date_receive DATE NOT NULL,
   id_feeder VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_purchare_order),
   FOREIGN KEY(id_feeder) REFERENCES Feeder(id_feeder)
);

CREATE TABLE purchase_detail(
   id_purchase_detail VARCHAR(50) ,
   quantity NUMERIC(15,2)   NOT NULL,
   unit_price NUMERIC(15,2)   NOT NULL,
   id_purchare_order VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_purchase_detail),
   FOREIGN KEY(id_purchare_order) REFERENCES Purchase_order(id_purchare_order)
);

CREATE TABLE goods_receipt(
   id_goods_receipt VARCHAR(50) ,
   date_receive DATE,
   status BOOLEAN,
   PRIMARY KEY(id_goods_receipt)
);

CREATE TABLE Payement(
   id_payement VARCHAR(50) ,
   date_payement DATE NOT NULL,
   id_goods_receipt VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_payement),
   FOREIGN KEY(id_goods_receipt) REFERENCES goods_receipt(id_goods_receipt)
);

CREATE TABLE Technician(
   id_technician VARCHAR(50) ,
   first_name TEXT NOT NULL,
   start_hour TIME,
   end_hour TIME NOT NULL,
   salary NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id_technician)
);

CREATE TABLE Skill(
   id_skill VARCHAR(50) ,
   label TEXT NOT NULL,
   PRIMARY KEY(id_skill),
   UNIQUE(label)
);

CREATE TABLE Technician_skill(
   id_technician_skill VARCHAR(50) ,
   id_technician VARCHAR(50)  NOT NULL,
   id_skill VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_technician_skill),
   FOREIGN KEY(id_technician) REFERENCES Technician(id_technician),
   FOREIGN KEY(id_skill) REFERENCES Skill(id_skill)
);

CREATE TABLE Appointment(
   id_appointment VARCHAR(50) ,
   date_appointment_ DATE,
   id_client VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_appointment),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Computer(
   id_computer VARCHAR(50) ,
   serie_number TEXT NOT NULL,
   id_model VARCHAR(50)  NOT NULL,
   id_client VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_computer),
   UNIQUE(serie_number),
   FOREIGN KEY(id_model) REFERENCES Model(id_model),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Service(
   id_service VARCHAR(50) ,
   date_deposition DATE NOT NULL,
   date_restitution DATE,
   desce TEXT NOT NULL,
   rating INTEGER NOT NULL,
   status BOOLEAN,
   id_technician VARCHAR(50)  NOT NULL,
   id_service_type VARCHAR(50)  NOT NULL,
   id_computer VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_service),
   FOREIGN KEY(id_technician) REFERENCES Technician(id_technician),
   FOREIGN KEY(id_service_type) REFERENCES Service_type(id_service_type),
   FOREIGN KEY(id_computer) REFERENCES Computer(id_computer)
);

CREATE TABLE Composite(
   id_composite VARCHAR(50) ,
   label TEXT NOT NULL,
   id_composite_type VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_composite),
   FOREIGN KEY(id_composite_type) REFERENCES composite_type(id_composite_type)
);

CREATE TABLE Inventory(
   id_inventory VARCHAR(50) ,
   entry NUMERIC(15,2)   NOT NULL,
   exit NUMERIC(15,2)  ,
   date_inventory DATE NOT NULL,
   id_composite VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_inventory),
   FOREIGN KEY(id_composite) REFERENCES Composite(id_composite)
);

CREATE TABLE Inventory_detail(
   id_inventory_detail VARCHAR(50) ,
   quantity NUMERIC(15,2)   NOT NULL,
   date_release DATE NOT NULL,
   id_ref TEXT NOT NULL,
   id_mouvement_type VARCHAR(50)  NOT NULL,
   id_composite VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_inventory_detail),
   FOREIGN KEY(id_mouvement_type) REFERENCES mouvement_type(id_mouvement_type),
   FOREIGN KEY(id_composite) REFERENCES Composite(id_composite)
);

CREATE TABLE Service_detail(
   id_service_detail VARCHAR(50) ,
   quantity NUMERIC(15,2)   NOT NULL,
   desce TEXT NOT NULL,
   id_composite VARCHAR(50)  NOT NULL,
   id_service VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_service_detail),
   FOREIGN KEY(id_composite) REFERENCES Composite(id_composite),
   FOREIGN KEY(id_service) REFERENCES Service(id_service)
);

CREATE TABLE Asso_15(
   id_composite VARCHAR(50) ,
   id_purchase_detail VARCHAR(50) ,
   PRIMARY KEY(id_composite, id_purchase_detail),
   FOREIGN KEY(id_composite) REFERENCES Composite(id_composite),
   FOREIGN KEY(id_purchase_detail) REFERENCES purchase_detail(id_purchase_detail)
);

CREATE TABLE bon_de_reception(
   id_purchare_order VARCHAR(50) ,
   id_goods_receipt VARCHAR(50) ,
   PRIMARY KEY(id_purchare_order, id_goods_receipt),
   FOREIGN KEY(id_purchare_order) REFERENCES Purchase_order(id_purchare_order),
   FOREIGN KEY(id_goods_receipt) REFERENCES goods_receipt(id_goods_receipt)
);
