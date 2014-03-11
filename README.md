cookbook-docker Cookbook
========================
Simply install for RHEL compatible Linux.

Requirements
------------
* CentOS6.5 or Amazon Linux 2013.09
* Chef 11 or higher
* opscode yum cookbook version 3.0.0 or higher

Attributes
----------
None

Usage
-----

e.g.
Just include `docker` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

