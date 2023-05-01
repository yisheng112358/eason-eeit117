function delConfirm()
  {
  var check=confirm("您確定要刪除此筆資料嗎?")
  if (check==true)
    {
    return true;
    }
  else
    {
    return false;
    }
  }