using Microsoft.AspNetCore.Mvc;
using microservice.Entity;
using microservice.Service;

namespace microservice.Controllers;

[ApiController]
[Route("[controller]")]
public class UsersController : ControllerBase
{
    private readonly ILogger<UsersController> logger;
    
    private readonly UserService userService;

    public UsersController(ILogger<UsersController> logger, UserService userService)
    {
        this.logger = logger;
        this.userService = userService;
    }

    [HttpGet(Name = "users")]
    public IEnumerable<User> Get()
    {
        return userService.getUsers();
    }
}
