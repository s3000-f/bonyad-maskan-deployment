print('Start creating database ##########################')
db.auth("mongodefaultuser","vY4bhAn0nkeB3WkNjU0Y")
db = db.getSiblingDB('sms');
db.createUser(
    {
        user: 'sms_user',
        pwd:  'IAlluuZQjozdNYt1rplD',
        roles: [{role: 'readWrite', db: 'sms'}],
    }
);

db = db.getSiblingDB('storage');
db.createUser(
    {
        user: 'storage_user',
        pwd:  'qGNb1S21fRsoZmgt89H9',
        roles: [{role: 'readWrite', db: 'storage'}],
    }
);
print('End creating database ##########################')