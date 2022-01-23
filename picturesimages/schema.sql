CREATE EXTENSION
IF NOT EXISTS "uuid-ossp";

Create table "Users"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "email" varchar(100) NOT NULL UNIQUE,
  "password" varchar(100) NOT NULL,
  "name" varchar(50) NOT NULL
);


CREATE TABLE "Categories"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "name" varchar(50),
  "userId" uuid NOT NULL REFERENCES "Users" ("id"),
  "parentId" uuid REFERENCES "Categories" ("id")
);


CREATE TABLE "Assets"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "categoryId" uuid REFERENCES "Categories" ("id"),
  "name" varchar(100) NOT NULL,
  "userId" uuid NOT NULL REFERENCES "Users" ("id"),
  "link" varchar(100)
);

CREATE TABLE "Types"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "userId" uuid NOT NULL REFERENCES "Users" ("id"),
  "name" varchar(50) NOT NULL,
  UNIQUE ("userId", "name")
);

CREATE TABLE "TypeRequiresTypes"
(
  "typeId" uuid NOT NULL REFERENCES "Types" ("id"),
  "requiredTypeId" uuid NOT NULL REFERENCES "Types" ("id"),
  PRIMARY KEY ("typeId", "requiredTypeId")
);

create table "AssetHasTypes"
(
  "assetId" uuid NOT NULL REFERENCES   "Assets" ("id"),
  "typeId" uuid NOT NULL REFERENCES "Types" ("id"),
  PRIMARY KEY ("assetId", "typeId")
);

CREATE TABLE "Attributes"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "typeId" uuid NOT NULL REFERENCES "Types" ("id"),
  UNIQUE ("name", "typeId")
);

CREATE TABLE "Values"
(
  "id" uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  "value" json,
  "attributeId" uuid NOT NULL REFERENCES "Attributes" (id),
  "assetId" uuid NOT NULL REFERENCES "Assets" (id),
  "typeId" uuid NOT NULL REFERENCES "Types" (id),
  -- "typeName" varchar(50) NOT NULL,
  -- "assetName" varchar(100) NOT NULL,
  UNIQUE ("assetId", "attributeId")
);



