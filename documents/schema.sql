-- Digital Twin Platform Database Schema

-- 1. Equipment Table
-- Stores the main equipment units (e.g., Boiler #1, Turbine #1)
CREATE TABLE equipment (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL, -- 'Boiler', 'Turbine', 'Generator'
    model_number VARCHAR(100),
    installation_date DATE,
    status VARCHAR(20) DEFAULT 'Operational' -- 'Operational', 'Maintenance', 'Fault'
);

-- 2. Components Table
-- Stores sub-components of equipment (e.g., Superheater, Water Wall)
CREATE TABLE components (
    id SERIAL PRIMARY KEY,
    equipment_id INTEGER REFERENCES equipment(id),
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50), -- 'Pipe', 'Valve', 'Pump'
    material VARCHAR(50),
    design_thickness DECIMAL(5, 2), -- mm
    warning_threshold DECIMAL(5, 2), -- mm (Thickness at which warning is triggered)
    critical_threshold DECIMAL(5, 2), -- mm (Thickness at which replacement is required)
    position_x DECIMAL(10, 2), -- 3D coordinates for mapping
    position_y DECIMAL(10, 2),
    position_z DECIMAL(10, 2)
);

-- 3. Real-Time Measurements Table (Simulated Data)
-- Stores high-frequency data points (Temperature, Pressure, etc.)
CREATE TABLE measurements (
    id SERIAL PRIMARY KEY,
    component_id INTEGER REFERENCES components(id),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    parameter_name VARCHAR(50) NOT NULL, -- 'Temperature', 'Pressure', 'Vibration'
    value DECIMAL(10, 2) NOT NULL,
    unit VARCHAR(20) NOT NULL -- '°C', 'MPa', 'mm/s'
);

-- 4. Maintenance Records Table
-- Stores manual inspection data, specifically thickness measurements
CREATE TABLE maintenance_records (
    id SERIAL PRIMARY KEY,
    component_id INTEGER REFERENCES components(id),
    inspection_date DATE NOT NULL,
    inspector_name VARCHAR(100),
    measured_thickness DECIMAL(5, 2), -- mm
    wear_rate DECIMAL(5, 4), -- mm/year (Calculated)
    next_inspection_date DATE,
    notes TEXT,
    attachment_url VARCHAR(255) -- Link to photos/reports
);

-- 5. Alerts Table
-- Stores system-generated alerts based on thresholds
CREATE TABLE alerts (
    id SERIAL PRIMARY KEY,
    component_id INTEGER REFERENCES components(id),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    severity VARCHAR(20) NOT NULL, -- 'Warning', 'Critical'
    message TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active', -- 'Active', 'Acknowledged', 'Resolved'
    acknowledged_by VARCHAR(100)
);

-- Initial Seed Data (Examples)
INSERT INTO equipment (name, type, status) VALUES 
('Boiler #1', 'Boiler', 'Operational'),
('Steam Turbine #1', 'Turbine', 'Operational');

INSERT INTO components (equipment_id, name, type, material, design_thickness, warning_threshold, critical_threshold) VALUES
(1, 'High Temp Superheater', 'Pipe', '12Cr1MoV', 6.0, 4.5, 4.0),
(1, 'Water Wall Panel A', 'Pipe', '20G', 5.0, 3.5, 3.0),
(2, 'Main Rotor', 'Rotor', '30Cr1Mo1V', NULL, NULL, NULL);
