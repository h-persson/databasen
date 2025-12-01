BEGIN;


INSERT INTO person (personal_number, first_name, last_name, address, phone_number) VALUES
  ('19800618-8519', 'Elisabeth', 'Andersson', 'Vasagatan 46, 114 28 Danderyd', '+46-70-7622093'),
  ('19940603-2190', 'Karin', 'Bengtsson', 'Vasagatan 57, 114 28 Taby', '+46-70-4569234'),
  ('19610309-9290', 'Oliver', 'Magnusson', 'Ringvagen 88, 114 28 Stockholm', '+46-70-4430113'),
  ('19830615-5237', 'Margareta', 'Magnusson', 'Valhallavagen 8, 114 28 Danderyd', '+46-70-3350125'),
  ('19610218-6104', 'William', 'Pettersson', 'Drottninggatan 83, 114 28 Stockholm', '+46-70-3225044'),
  ('19810608-8352', 'Lars', 'Lindberg', 'Kungsgatan 38, 114 28 Taby', '+46-70-7404767'),
  ('19901028-6051', 'Noah', 'Lindberg', 'Valhallavagen 70, 114 28 Sundbyberg', '+46-70-6367061'),
  ('19900209-7972', 'Karl', 'Pettersson', 'Kungsgatan 8, 114 28 Solna', '+46-70-8038408'),
  ('19771227-6555', 'Ella', 'Bengtsson', 'Odengatan 63, 114 28 Sundbyberg', '+46-70-1315412'),
  ('19690301-4161', 'Noah', 'Johansson', 'Gotgatan 48, 114 28 Taby', '+46-70-7895690'),
  ('19870804-1574', 'Liam', 'Eriksson', 'Brinellvagen 88, 114 28 Taby', '+46-70-7810561'),
  ('19640609-5122', 'Carl', 'Svensson', 'Gotgatan 59, 114 28 Stockholm', '+46-70-9182138'),
  ('19821202-1036', 'Per', 'Olofsson', 'Gotgatan 93, 114 28 Sundbyberg', '+46-70-1303419'),
  ('19610712-4004', 'Alice', 'Persson', 'Drottning Kristinas vag 49, 114 28 Sundbyberg', '+46-70-3560767'),
  ('19750410-3936', 'Carl', 'Olsson', 'Vasagatan 59, 114 28 Sundbyberg', '+46-70-5890977'),
  ('19940504-4441', 'Kristina', 'Bengtsson', 'Lindstedtsvagen 54, 114 28 Nacka', '+46-70-1726407'),
  ('19840428-6238', 'Alice', 'Gustafsson', 'Odengatan 65, 114 28 Sundbyberg', '+46-70-3129677'),
  ('19780608-3864', 'Hugo', 'Pettersson', 'Odengatan 35, 114 28 Stockholm', '+46-70-2409345'),
  ('19801104-2490', 'Margareta', 'Magnusson', 'Teknikringen 69, 114 28 Solna', '+46-70-1891449'),
  ('19850202-7812', 'Marie', 'Jonsson', 'Vasagatan 53, 114 28 Danderyd', '+46-70-1318717'),
  ('19650521-8229', 'Marie', 'Karlsson', 'Brinellvagen 47, 114 28 Nacka', '+46-70-2978655'),
  ('19780206-6944', 'Eva', 'Svensson', 'Gotgatan 62, 114 28 Sundbyberg', '+46-70-4688717'),
  ('19640405-5797', 'Nils', 'Johansson', 'Drottning Kristinas vag 43, 114 28 Taby', '+46-70-6926489'),
  ('19641215-9658', 'Liam', 'Svensson', 'Drottninggatan 42, 114 28 Danderyd', '+46-70-7330725'),
  ('19631011-4786', 'Birgitta', 'Jonsson', 'Odengatan 94, 114 28 Sundbyberg', '+46-70-9722581'),
  ('19991109-5709', 'Kristina', 'Jakobsson', 'Teknikringen 28, 114 28 Stockholm', '+46-70-5364863'),
  ('19830307-6549', 'Karl', 'Jansson', 'Lindstedtsvagen 29, 114 28 Nacka', '+46-70-2016058'),
  ('19850417-4898', 'Alexander', 'Andersson', 'Drottninggatan 93, 114 28 Nacka', '+46-70-3516664'),
  ('19990515-6481', 'Ebba', 'Johansson', 'Valhallavagen 100, 114 28 Taby', '+46-70-4187089'),
  ('19810720-2038', 'Noah', 'Bengtsson', 'Teknikringen 11, 114 28 Stockholm', '+46-70-2394970'),
  ('19820314-1366', 'Mikael', 'Nilsson', 'Drottninggatan 49, 114 28 Nacka', '+46-70-3203653'),
  ('19690128-6388', 'Birgitta', 'Pettersson', 'Drottning Kristinas vag 33, 114 28 Solna', '+46-70-7747027'),
  ('19990917-4469', 'Alice', 'Pettersson', 'Lindstedtsvagen 71, 114 28 Solna', '+46-70-6531270'),
  ('19731212-6342', 'Elsa', 'Svensson', 'Valhallavagen 72, 114 28 Stockholm', '+46-70-7868416'),
  ('19800301-5713', 'Nils', 'Jansson', 'Teknikringen 91, 114 28 Danderyd', '+46-70-3068927'),
  ('19890306-7779', 'Elsa', 'Jonsson', 'Gotgatan 29, 114 28 Danderyd', '+46-70-3557581'),
  ('19621215-8900', 'Erik', 'Gustafsson', 'Kungsgatan 16, 114 28 Sundbyberg', '+46-70-8307478'),
  ('19890828-5642', 'Elsa', 'Lindberg', 'Storgatan 36, 114 28 Taby', '+46-70-2622537'),
  ('19721109-8408', 'Hugo', 'Olofsson', 'Hornsgatan 9, 114 28 Taby', '+46-70-2961575'),
  ('19970118-2474', 'Elisabet', 'Jakobsson', 'Kungsgatan 39, 114 28 Solna', '+46-70-4656255');


INSERT INTO employee (person_id, supervisor_employee_id, job_title_id, department_id) VALUES
  ((SELECT person_id FROM person WHERE personal_number = '19800618-8519'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19940603-2190'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 4, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19610309-9290'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19830615-5237'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19610218-6104'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19810608-8352'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19901028-6051'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19900209-7972'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 4, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19771227-6555'), NULL, 3, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19690301-4161'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 4, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19870804-1574'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19640609-5122'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19821202-1036'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19610712-4004'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19750410-3936'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19940504-4441'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19840428-6238'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19780608-3864'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19801104-2490'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19850202-7812'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19650521-8229'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 4, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19780206-6944'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19640405-5797'), NULL, 2, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19641215-9658'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19631011-4786'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19991109-5709'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19830307-6549'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19850417-4898'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19990515-6481'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19810720-2038'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19820314-1366'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 5, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19690128-6388'), NULL, 2, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19990917-4469'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19731212-6342'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 4, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19800301-5713'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19890306-7779'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 1),
  ((SELECT person_id FROM person WHERE personal_number = '19621215-8900'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19890828-5642'), NULL, 3, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19721109-8408'), (SELECT employee_id FROM employee WHERE job_title_id IN (1,2,3) ORDER BY RANDOM() LIMIT 1), 6, 2),
  ((SELECT person_id FROM person WHERE personal_number = '19970118-2474'), NULL, 3, 2);


INSERT INTO salary (employee_id, salary_date, salary) VALUES
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800618-8519'), '2025-01-25', 417),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940603-2190'), '2025-01-25', 385),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610309-9290'), '2025-01-25', 440),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830615-5237'), '2025-01-25', 264),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610218-6104'), '2025-01-25', 400),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810608-8352'), '2025-01-25', 200),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19901028-6051'), '2025-01-25', 253),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19900209-7972'), '2025-01-25', 373),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19771227-6555'), '2025-01-25', 439),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690301-4161'), '2025-01-25', 393),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19870804-1574'), '2025-01-25', 414),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640609-5122'), '2025-01-25', 280),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19821202-1036'), '2025-01-25', 208),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610712-4004'), '2025-01-25', 274),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19750410-3936'), '2025-01-25', 229),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940504-4441'), '2025-01-25', 275),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19840428-6238'), '2025-01-25', 231),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780608-3864'), '2025-01-25', 222),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19801104-2490'), '2025-01-25', 404),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19850202-7812'), '2025-01-25', 249),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19650521-8229'), '2025-01-25', 384),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780206-6944'), '2025-01-25', 205),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640405-5797'), '2025-01-25', 495),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19641215-9658'), '2025-01-25', 272),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19631011-4786'), '2025-01-25', 254),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19991109-5709'), '2025-01-25', 269),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830307-6549'), '2025-01-25', 200),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19850417-4898'), '2025-01-25', 248),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990515-6481'), '2025-01-25', 218),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810720-2038'), '2025-01-25', 252),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19820314-1366'), '2025-01-25', 230),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690128-6388'), '2025-01-25', 468),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990917-4469'), '2025-01-25', 410),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19731212-6342'), '2025-01-25', 370),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800301-5713'), '2025-01-25', 267),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890306-7779'), '2025-01-25', 245),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19621215-8900'), '2025-01-25', 278),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890828-5642'), '2025-01-25', 429),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19721109-8408'), '2025-01-25', 261),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19970118-2474'), '2025-01-25', 434);


INSERT INTO skill_set (employee_id, skill_id) VALUES
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800618-8519'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800618-8519'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800618-8519'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940603-2190'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940603-2190'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940603-2190'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610309-9290'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830615-5237'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830615-5237'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610218-6104'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610218-6104'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610218-6104'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810608-8352'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810608-8352'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810608-8352'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19901028-6051'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19901028-6051'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19900209-7972'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19900209-7972'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19771227-6555'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19771227-6555'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19771227-6555'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690301-4161'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690301-4161'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690301-4161'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19870804-1574'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19870804-1574'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19870804-1574'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640609-5122'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19821202-1036'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19821202-1036'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610712-4004'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19610712-4004'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19750410-3936'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19750410-3936'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19750410-3936'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19940504-4441'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19840428-6238'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19840428-6238'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780608-3864'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780608-3864'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780608-3864'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19801104-2490'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19801104-2490'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19801104-2490'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19850202-7812'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19850202-7812'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19650521-8229'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19650521-8229'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19780206-6944'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640405-5797'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640405-5797'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19640405-5797'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19641215-9658'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19641215-9658'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19641215-9658'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19631011-4786'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19631011-4786'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19631011-4786'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19991109-5709'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830307-6549'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19830307-6549'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19850417-4898'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990515-6481'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990515-6481'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990515-6481'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810720-2038'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810720-2038'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19810720-2038'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19820314-1366'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19820314-1366'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19820314-1366'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690128-6388'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19690128-6388'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990917-4469'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19990917-4469'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19731212-6342'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19731212-6342'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19731212-6342'), 3),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19800301-5713'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890306-7779'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890306-7779'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890306-7779'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19621215-8900'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19621215-8900'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19621215-8900'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890828-5642'), 4),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890828-5642'), 2),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19890828-5642'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19721109-8408'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19970118-2474'), 5),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19970118-2474'), 1),
  ((SELECT employee_id FROM employee JOIN person ON person.person_id = employee.person_id WHERE person.personal_number = '19970118-2474'), 2);


INSERT INTO course_layout (course_code, course_name, version, hp, min_students, max_students) VALUES
  ('DD2431', 'Introduction to Database Technology', 1, 7.5, 50, 237),
  ('ID2893', 'Analysis Optimization II', 1, 7.5, 21, 175),
  ('ME1677', 'Principles of Software Engineering II', 1, 7.5, 37, 145),
  ('DD1546', 'Systems Cloud Computing II', 1, 7.5, 54, 270),
  ('DD1504', 'Theory Human-Computer Interaction', 1, 7.5, 21, 107),
  ('ME1243', 'Principles of Cybersecurity', 1, 7.5, 52, 239),
  ('ID1901', 'Principles of Optimization', 1, 7.5, 45, 211),
  ('ID2304', 'Advanced Database Technology', 1, 7.5, 43, 292),
  ('SF2423', 'Theory Network Security', 1, 7.5, 35, 211),
  ('ID1533', 'Design Statistics II', 1, 7.5, 29, 173);


INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-78455', 211, (SELECT course_layout_id FROM course_layout WHERE course_code = 'DD2431'), 2025, 1);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-78455', 1, 43),
  ('2025-78455', 5, 12),
  ('2025-78455', 6, calc_admin_hours('2025-78455')),
  ('2025-78455', 7, calc_exam_hours('2025-78455')),
  ('2025-78455', 2, 23),
  ('2025-78455', 3, 28);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-78455', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 43),
  ('2025-78455', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 12),
  ('2025-78455', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-78455')),
  ('2025-78455', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-78455')),
  ('2025-78455', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 23),
  ('2025-78455', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 28);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-46601', 98, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ID2893'), 2025, 3);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-46601', 1, 34),
  ('2025-46601', 5, 28),
  ('2025-46601', 6, calc_admin_hours('2025-46601')),
  ('2025-46601', 7, calc_exam_hours('2025-46601')),
  ('2025-46601', 3, 27);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-46601', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 34),
  ('2025-46601', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 28),
  ('2025-46601', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-46601')),
  ('2025-46601', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-46601')),
  ('2025-46601', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 27);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-85434', 40, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ME1677'), 2025, 4);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-85434', 1, 31),
  ('2025-85434', 5, 26),
  ('2025-85434', 6, calc_admin_hours('2025-85434')),
  ('2025-85434', 7, calc_exam_hours('2025-85434')),
  ('2025-85434', 2, 22),
  ('2025-85434', 3, 11);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-85434', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 31),
  ('2025-85434', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 26),
  ('2025-85434', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-85434')),
  ('2025-85434', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-85434')),
  ('2025-85434', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 22),
  ('2025-85434', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 11);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-19232', 81, (SELECT course_layout_id FROM course_layout WHERE course_code = 'DD1546'), 2025, 3);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-19232', 1, 47),
  ('2025-19232', 5, 22),
  ('2025-19232', 6, calc_admin_hours('2025-19232')),
  ('2025-19232', 7, calc_exam_hours('2025-19232'));
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-19232', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 47),
  ('2025-19232', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 22),
  ('2025-19232', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-19232')),
  ('2025-19232', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-19232'));

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2026-69862', 105, (SELECT course_layout_id FROM course_layout WHERE course_code = 'DD1504'), 2026, 4);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2026-69862', 1, 27),
  ('2026-69862', 5, 12),
  ('2026-69862', 6, calc_admin_hours('2026-69862')),
  ('2026-69862', 7, calc_exam_hours('2026-69862')),
  ('2026-69862', 2, 54),
  ('2026-69862', 3, 18);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2026-69862', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 27),
  ('2026-69862', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 12),
  ('2026-69862', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2026-69862')),
  ('2026-69862', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2026-69862')),
  ('2026-69862', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 54),
  ('2026-69862', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 18);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-41329', 79, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ME1243'), 2025, 3);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-41329', 1, 21),
  ('2025-41329', 5, 11),
  ('2025-41329', 6, calc_admin_hours('2025-41329')),
  ('2025-41329', 7, calc_exam_hours('2025-41329')),
  ('2025-41329', 2, 43),
  ('2025-41329', 4, 17);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-41329', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 21),
  ('2025-41329', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 11),
  ('2025-41329', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-41329')),
  ('2025-41329', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-41329')),
  ('2025-41329', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 43),
  ('2025-41329', 4, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 17);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2026-13169', 163, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ME1243'), 2026, 3);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2026-13169', 1, 33),
  ('2026-13169', 5, 19),
  ('2026-13169', 6, calc_admin_hours('2026-13169')),
  ('2026-13169', 7, calc_exam_hours('2026-13169')),
  ('2026-13169', 2, 45),
  ('2026-13169', 3, 16);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2026-13169', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 33),
  ('2026-13169', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 19),
  ('2026-13169', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2026-13169')),
  ('2026-13169', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2026-13169')),
  ('2026-13169', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 45),
  ('2026-13169', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 16);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-63979', 184, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ID1901'), 2025, 1);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-63979', 1, 44),
  ('2025-63979', 5, 29),
  ('2025-63979', 6, calc_admin_hours('2025-63979')),
  ('2025-63979', 7, calc_exam_hours('2025-63979')),
  ('2025-63979', 3, 12);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-63979', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 44),
  ('2025-63979', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 29),
  ('2025-63979', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-63979')),
  ('2025-63979', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-63979')),
  ('2025-63979', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 12);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2026-18381', 65, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ID2304'), 2026, 4);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2026-18381', 1, 34),
  ('2026-18381', 5, 27),
  ('2026-18381', 6, calc_admin_hours('2026-18381')),
  ('2026-18381', 7, calc_exam_hours('2026-18381')),
  ('2026-18381', 2, 52),
  ('2026-18381', 4, 13);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2026-18381', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 34),
  ('2026-18381', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 27),
  ('2026-18381', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2026-18381')),
  ('2026-18381', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2026-18381')),
  ('2026-18381', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 52),
  ('2026-18381', 4, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 13);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-26674', 161, (SELECT course_layout_id FROM course_layout WHERE course_code = 'SF2423'), 2025, 2);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-26674', 1, 43),
  ('2025-26674', 5, 14),
  ('2025-26674', 6, calc_admin_hours('2025-26674')),
  ('2025-26674', 7, calc_exam_hours('2025-26674')),
  ('2025-26674', 2, 37),
  ('2025-26674', 3, 14),
  ('2025-26674', 4, 12);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-26674', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 43),
  ('2025-26674', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 14),
  ('2025-26674', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-26674')),
  ('2025-26674', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-26674')),
  ('2025-26674', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 37),
  ('2025-26674', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 14),
  ('2025-26674', 4, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 12);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2026-91385', 161, (SELECT course_layout_id FROM course_layout WHERE course_code = 'SF2423'), 2026, 1);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2026-91385', 1, 38),
  ('2026-91385', 5, 21),
  ('2026-91385', 6, calc_admin_hours('2026-91385')),
  ('2026-91385', 7, calc_exam_hours('2026-91385')),
  ('2026-91385', 2, 37),
  ('2026-91385', 3, 15);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2026-91385', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 38),
  ('2026-91385', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 21),
  ('2026-91385', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2026-91385')),
  ('2026-91385', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2026-91385')),
  ('2026-91385', 2, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 37),
  ('2026-91385', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 15);

INSERT INTO course_instance (course_instance_id, num_students, course_layout_id, study_year, study_period_id) VALUES
  ('2025-28690', 166, (SELECT course_layout_id FROM course_layout WHERE course_code = 'ID1533'), 2025, 1);
INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
  ('2025-28690', 1, 27),
  ('2025-28690', 5, 19),
  ('2025-28690', 6, calc_admin_hours('2025-28690')),
  ('2025-28690', 7, calc_exam_hours('2025-28690')),
  ('2025-28690', 3, 15);
INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
  ('2025-28690', 1, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 27),
  ('2025-28690', 5, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 19),
  ('2025-28690', 6, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_admin_hours('2025-28690')),
  ('2025-28690', 7, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), calc_exam_hours('2025-28690')),
  ('2025-28690', 3, (SELECT employee_id FROM employee ORDER BY RANDOM() LIMIT 1), 15);

COMMIT;
