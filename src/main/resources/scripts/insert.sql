INSERT INTO public.companies (id, name, key, currency, logo_url, about, site_url, privacy_policy, phone) VALUES
  (65650, 'Microsoft', 'ms', 1500000000, 'http://www.microsoft.com/favicon.ico', 'Microsoft - Official Home Page',
   'http://www.microsoft.com', '', '+12345678');

INSERT INTO public.devices (id, brand, model, token, company_key, unique_id)
VALUES (2056, 'Windows Phone', '640 XL', 'win_phone_640_xl', 'ms', '12345678');

INSERT INTO public.news (id, photo_url, modified_date, created_date, content, title, company_id) VALUES
  (2060, 'http://i.webapps.microsoft.com/r/image/view/-/5873134/extraHighRes/2/-/MSUS-Lumia640XL-Heroe02-1x1-jpg.jpg',
   '2015-09-20 01:07:10.318000', '2015-09-20 01:07:10.318000',
   'Read more here - http://www.microsoft.com/en-us/mobile/phone/lumia640-xl/', 'Windows Ph', 65650);

INSERT INTO public.products (id, photo_url, description, name, mark, company_id) VALUES (2055,
                                                                                         'http://compass.surface.com/assets/74/c0/74c067a9-0d5d-401b-80cc-936c3ca5ad4f.png?n=SurfaceHP_Win10Hero_1080.png',
                                                                                         'Read more here - http://www.microsoft.com/surface',
                                                                                         'Suface', 12345678, 65650);

INSERT INTO public.users (id, full_name, email, gender, birthday, promotional_code, device_id)
VALUES (2051, 'Elyor Latipov', 'elyor@outlook.com', 'male', '1989-05-29 00:00:00.000000', 52989, 2056);