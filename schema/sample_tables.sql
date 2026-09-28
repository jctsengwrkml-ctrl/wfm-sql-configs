-- Synthetic sample schema. Not modeled on any vendor's actual tables.
CREATE TABLE employee (
    employee_id   INT PRIMARY KEY,
    full_name     TEXT NOT NULL,
    pay_rule      TEXT NOT NULL
);

CREATE TABLE punch (
    punch_id      SERIAL PRIMARY KEY,
    employee_id   INT REFERENCES employee(employee_id),
    punch_in      TIMESTAMPTZ NOT NULL,
    punch_out     TIMESTAMPTZ
);
