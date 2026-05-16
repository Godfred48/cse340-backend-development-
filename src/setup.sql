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


  -- Category table
CREATE TABLE public.category (
    category_id   SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL UNIQUE
);

-- Junction table (links projects to categories)
CREATE TABLE public.project_category (
    project_id    INT NOT NULL,
    category_id   INT NOT NULL,

    PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
        REFERENCES public.service_project(project_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES public.category(category_id)
        ON DELETE CASCADE
);

INSERT INTO public.category (name)
VALUES
    ('Construction & Infrastructure'),
    ('Environment & Sustainability'),
    ('Community Support'),
    ('Education & Training'),
    ('Food & Agriculture');

-- BrightFuture Builders projects (Construction & Infrastructure = 1, Education = 4)
INSERT INTO public.project_category (project_id, category_id) VALUES
    (1, 1),  -- Community Center Renovation → Construction
    (2, 1),  -- School Roof Repair → Construction
    (2, 4),  -- School Roof Repair → Education
    (3, 1),  -- Playground Construction → Construction
    (3, 3),  -- Playground Construction → Community Support
    (4, 1),  -- Library Expansion → Construction
    (4, 4),  -- Library Expansion → Education
    (5, 1),  -- Water Tank Installation → Construction
    (5, 2),  -- Water Tank Installation → Environment

-- GreenHarvest Growers projects (Environment = 2, Food = 5, Education = 4)
    (6, 2),  -- Rooftop Garden Setup → Environment
    (6, 5),  -- Rooftop Garden Setup → Food & Agriculture
    (7, 2),  -- Composting Workshop → Environment
    (7, 4),  -- Composting Workshop → Education
    (8, 5),  -- School Farm Program → Food & Agriculture
    (8, 4),  -- School Farm Program → Education
    (9, 5),  -- Seed Sharing Drive → Food & Agriculture
    (9, 2),  -- Seed Sharing Drive → Environment
    (10, 4), -- Urban Irrigation Training → Education
    (10, 5), -- Urban Irrigation Training → Food & Agriculture

-- UnityServe Volunteers projects (Community = 3, Environment = 2, Education = 4)
    (11, 3), -- Food Bank Support → Community Support
    (11, 5), -- Food Bank Support → Food & Agriculture
    (12, 3), -- Elder Care Visits → Community Support
    (13, 2), -- Beach Cleanup → Environment
    (13, 3), -- Beach Cleanup → Community Support
    (14, 3), -- Charity Fundraiser Run → Community Support
    (15, 3), -- Back to School Drive → Community Support
    (15, 4); -- Back to School Drive → Education


SELECT * FROM public.project_category;