Encryptor = {}



local hexNums = { };

for i = 0, 9 do

hexNums[i] = tostring(i);

end

hexNums[10] = "A";

hexNums[11] = "B";

hexNums[12] = "C";

hexNums[13] = "D";

hexNums[14] = "E";

hexNums[15] = "F";





local decNums = { };

for i = 0, 9 do

decNums[tostring(i)] = i;

end

decNums["A"] = 10;

decNums["B"] = 11;

decNums['C'] = 12;

decNums['D'] = 13;

decNums['E'] = 14;

decNums['F'] = 15;



Encryptor.decToHex = function(num)

local output = "";

while num > 0 do

local remainder = num % 16;

output = hexNums[remainder] .. output;

num = math.floor(num / 16);

end

return output;

end



Encryptor.hexToDec = function(num)

local output = 0;

local max = string.len(num)

for i = 1, max do

local decnum = decNums[string.sub(num, i, i)]

output = output + decnum * (16 ^ (max - i));

end

return output

end

Encryptor.GetUTF8Table = function()

local TableUTF8 = {}

local i = 1

repeat

table.insert(TableUTF8, {utf8.char(i), i})

wait()

i = i + 1

until i == 127

return TableUTF8

end

Encryptor.UTF8Table = Encryptor.GetUTF8Table()

Encryptor.GetUTF8Number = function(char)

local UTF8Table = Encryptor.UTF8Table

if string.len(char) > 1 then

warn'The input cannot be higher than one character'

elseif string.len(char) < 1 then

warn'The input cannot be lower than one character'

else

 for q,v in pairs(UTF8Table) do

if char == v[1] then

return v[2]

end

end



end

end

Encryptor.Encrypt = function(text, key)

local TextCode = 0

local KeyCode = 0

local Encrypted = ""

local TextCodes = {}

for a=1, string.len(text) do

table.insert(TextCodes, {Encryptor.GetUTF8Number(string.sub(text,a,a))})

end

for b=1, string.len(key) do

KeyCode = (KeyCode + Encryptor.GetUTF8Number(string.sub(key,b,b)))

end

for i, v in pairs(TextCodes) do

if i == 1 then

Encrypted = Encrypted..(Encryptor.decToHex(v[1] *  KeyCode))

else

Encrypted = Encrypted.."-"..(Encryptor.decToHex(v[1] *  KeyCode))

end

end

return Encrypted

end



Encryptor.Decrypt = function(text, key)

local KeyCode = 0

local TextCodes = {}

local UTF8Table = Encryptor.UTF8Table

local EncryptedCodes = string.split(text, "-")

local Decrypted = ""

for a=1, string.len(key) do

KeyCode = (KeyCode + Encryptor.GetUTF8Number(string.sub(key,a,a)))

end

for i,v in pairs(EncryptedCodes) do

if EncryptedCodes[i] ~= "" then

table.insert(TextCodes, {Encryptor.hexToDec(EncryptedCodes[i]) / KeyCode})

end

end

for i,v in pairs(TextCodes) do

for q,e in pairs(UTF8Table) do

if v[1] == e[2] then

Decrypted = Decrypted..e[1]

end

end

end

return Decrypted
end
