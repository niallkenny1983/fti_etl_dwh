  -- Table: claim

-- DROP TABLE claim;

CREATE TABLE claim
(
  claim_id integer NOT NULL,
  c character varying(255),
  claim_date date,
  create_date date NOT NULL,
  update_date date NOT NULL,
  updated_by character varying(60) NOT NULL,
  CONSTRAINT claim_pkey PRIMARY KEY (claim_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE claim
  OWNER TO postgres;
  
  
 -- Table: policy

-- DROP TABLE policy;

CREATE TABLE policy
(
  policy_id integer NOT NULL,
  policy_short_desc character varying(255),
  policy_status character varying(45) NOT NULL,
  create_date date NOT NULL,
  update_date date NOT NULL,
  updated_by character varying(60) NOT NULL,
  CONSTRAINT policy_pkey PRIMARY KEY (policy_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE policy
  OWNER TO postgres;

  
  -- Table: "time"

-- DROP TABLE "time";

CREATE TABLE "time"
(
  time_key integer NOT NULL,
  day character varying(9),
  month character varying(2),
  quarter character varying(1),
  year character varying(4),
  CONSTRAINT time_pkey PRIMARY KEY (time_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "time"
  OWNER TO postgres;


  -- Table: "Line_Fact"

-- DROP TABLE "Line_Fact";

CREATE TABLE "Line_Fact"
(
  "LINE_ID" integer NOT NULL,
  "POLICY_ID" integer NOT NULL,
  "CLAIM_ID" integer NOT NULL,
  "LINE_STATUS" integer,
  "LINE_ERROR_CODE" integer,
  "LINE_VALUE" numeric NOT NULL,
  "VALID_LINE" integer,
  "CREATE_DATE" date NOT NULL,
  "UPDATE_DATE" date NOT NULL,
  "UPDATED_BY" character varying(60)[] NOT NULL,
  "TIME_KEY" integer NOT NULL,
  CONSTRAINT line_id_primary_key PRIMARY KEY ("LINE_ID"),
  CONSTRAINT claim_id_fk FOREIGN KEY ("CLAIM_ID")
      REFERENCES claim (claim_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT policy_id_fk FOREIGN KEY ("POLICY_ID")
      REFERENCES policy (policy_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT time_fk FOREIGN KEY ("TIME_KEY")
      REFERENCES "time" (time_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Line_Fact"
  OWNER TO postgres;
