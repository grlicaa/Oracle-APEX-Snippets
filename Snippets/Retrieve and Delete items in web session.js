/*Assign & Delete Values in SessionStorage*/
 

const keys = ['GENERIC_ITEM_KEY_1', 'GENERIC_ITEM_KEY_2'];

for (let i = 0; i < keys.length; i++) {
    const key = keys[i];
    const storedValue = sessionStorage.getItem(key);
    apex.item(key).setValue(storedValue);
    sessionStorage.removeItem(key);
}