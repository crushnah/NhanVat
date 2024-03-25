pragma solidity ^0.8.24;

contract NV 
{
    enum HE {Xathu, Phapsu, Dausi, Dodon}
    
    struct NhanVat
    {
        uint id;
        string name;
        uint level;
        uint rank;
        uint Hp;
        uint Mana;
        HE he;
    }
    
    NhanVat[] public danhsach;
    
    function set_Nhanvat(uint _id, string memory _name, uint _level, uint _rank, uint _Hp, uint _Mana,HE _he) public
    {
        NhanVat memory nhanvat = NhanVat(_id, _name, _level, _rank, _Hp, _Mana , _he);
        danhsach.push(nhanvat);
    }
    function get_Nhanvat(uint index) public view returns(uint _id, string memory _name, uint _level, uint _rank, uint _Hp, uint _Mana,HE _he) {
        NhanVat memory nhanvat = danhsach[index];
        return (nhanvat.id, nhanvat.name, nhanvat.level, nhanvat.rank, nhanvat.Hp, nhanvat.Mana ,  nhanvat.he);
    }
    function clear(uint idxoa) public 
    {
         uint n = danhsach.length;
    for (uint i = 0; i < n; i++)
    {
        if(danhsach[i].id == idxoa)
        {
            danhsach[i] = danhsach[n - 1];
             danhsach.pop();
            return;
        }
    }
    }
    function rankmax() public view returns(uint[] memory)
    {
        uint n = danhsach.length;
        uint max = danhsach[0].rank;
        for(uint i = 0 ; i < n ; i++)
        {
            if(danhsach[i].rank  > max)
            {
                max = danhsach[i].rank;
            }
        }
       uint dem = 0;
    for(uint i = 0; i < n; i++)
    {
        if(danhsach[i].rank == max)
        {
            dem++;
        }
    }
    uint[] memory newMax = new uint[](dem);
    uint index = 0;
    for(uint i = 0; i < n; i++)
    {
        if(danhsach[i].rank == max)
        {
            newMax[index] = max;
            index++;
        }
    }
    return newMax;
    }
    function inTT() public view returns(uint[] memory, string[] memory, uint[] memory, uint[] memory, uint[] memory, uint[] memory, HE[] memory) 
    {
        uint n = danhsach.length;
        uint[] memory _id = new uint[](n);
        string[] memory _name = new string[](n);
        uint[] memory _level = new uint[](n);
        uint[] memory _rank = new uint[](n);
        uint[] memory _Hp = new uint[](n);
        uint[] memory _Mana = new uint[](n);
        HE[] memory _he = new HE[](n);
        for(uint i = 0 ; i < n ; i++)
        {
            _id[i] = danhsach[i].id;
            _name[i] = danhsach[i].name;
            _level[i] = danhsach[i].level;
            _rank[i] = danhsach[i].rank;
            _Hp[i] = danhsach[i].Hp;
            _Mana[i] = danhsach[i].Mana;
             _he[i] = danhsach[i].he;
            
        }
        return(_id, _name, _level, _rank, _Hp, _Mana,_he);
    }
}
