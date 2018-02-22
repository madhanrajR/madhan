import "./tok1.sol";
contract StandardToken is Token {

    function transfer(address _to, uint256 _value) returns (bool success) {
       
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
    function transferFrom(address _from, address _to, uint256 _value)   returns (bool success) 
    {
       if (balances[_from] >= _value && allowed[msg.sender][_from] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[msg.sender] -= _value;
            allowed[msg.sender][_from] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } 
        else 
        {
            return false; 
            
        }
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        balances[_spender]=_value;
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }
mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
}
