/*Store Items in SessionStorage*/

const itemKeys = ['P_ITEM_KEY_1', 'P_ITEM_KEY_2'];

for (let i = 0; i < itemKeys.length; i++) {
  
  const key = itemKeys[i];
  const value = apex.item(key).getValue();
  sessionStorage.setItem(key, value);
}