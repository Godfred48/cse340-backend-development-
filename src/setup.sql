-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

--inserting data into organization table
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
  (
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
  ),
  (
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
  ),
  (
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
  );

  SELECT * FROM organization;

  --creating table for projects 
  CREATE TABLE public.service_project (
    project_id      SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title           VARCHAR(255) NOT NULL,
    description     TEXT,
    location        VARCHAR(255),
    project_date            DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES public.organization(organization_id)
        ON DELETE CASCADE
);

--inserting data into projects table 
INSERT INTO public.service_project (organization_id, title, description, location, project_date)
VALUES
  -- BrightFuture Builders (organization_id = 1)
  (1, 'Community Center Renovation', 'Renovating the local community center with sustainable materials.', 'Accra, Ghana', '2025-06-15'),
  (1, 'School Roof Repair', 'Repairing damaged roofs at three public schools.', 'Tema, Ghana', '2025-07-20'),
  (1, 'Playground Construction', 'Building a new playground for neighborhood children.', 'Kumasi, Ghana', '2025-08-10'),
  (1, 'Library Expansion', 'Adding a new wing to the district library.', 'Takoradi, Ghana', '2025-09-05'),
  (1, 'Water Tank Installation', 'Installing water storage tanks for underserved communities.', 'Cape Coast, Ghana', '2025-10-01'),

  -- GreenHarvest Growers (organization_id = 2)
  (2, 'Rooftop Garden Setup', 'Creating rooftop vegetable gardens in urban apartments.', 'Accra, Ghana', '2025-06-20'),
  (2, 'Composting Workshop', 'Teaching residents how to compost organic waste.', 'Madina, Ghana', '2025-07-15'),
  (2, 'School Farm Program', 'Establishing small farms in school compounds.', 'Kasoa, Ghana', '2025-08-01'),
  (2, 'Seed Sharing Drive', 'Distributing indigenous seeds to local farmers.', 'Nsawam, Ghana', '2025-09-10'),
  (2, 'Urban Irrigation Training', 'Training urban gardeners on efficient irrigation.', 'Accra, Ghana', '2025-10-12'),

  -- UnityServe Volunteers (organization_id = 3)
  (3, 'Food Bank Support', 'Sorting and distributing food at the local food bank.', 'Accra, Ghana', '2025-06-10'),
  (3, 'Elder Care Visits', 'Visiting and assisting elderly residents in care homes.', 'Accra, Ghana', '2025-07-05'),
  (3, 'Beach Cleanup', 'Organizing a cleanup along Labadi Beach.', 'Labadi, Ghana', '2025-08-20'),
  (3, 'Charity Fundraiser Run', 'A 5K run to raise funds for local charities.', 'Accra, Ghana', '2025-09-25'),
  (3, 'Back to School Drive', 'Donating school supplies to underprivileged students.', 'Accra, Ghana', '2025-10-08');


  SELECT * FROM public.service_project;
