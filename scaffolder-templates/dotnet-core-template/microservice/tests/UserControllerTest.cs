using System.Linq;
using microservice.Data;
using microservice.Entity;
using microservice.Service;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Xunit;
using microservice.Controllers;

namespace tests;

public class UserControllerTest
{
    [Fact]
    public void TestShouldGetUsers()
    {
        var options = new DbContextOptionsBuilder<MicroserviceContext>()
            .UseInMemoryDatabase(databaseName: "testing")
            .Options;

        var logger = new LoggerFactory();

        using (var context = new MicroserviceContext(options)) {
            context.Users.Add(new User { Name = "John"});
            context.Users.Add(new User { Name = "Doe"});
            context.SaveChanges();
            
            var userService = new UserService(
                context,
                logger.CreateLogger<UserService>()
            );

            var userController = new UsersController(
                logger.CreateLogger<UsersController>(),
                userService
            );

            var response = userController.Get();

            Assert.Equal(2, response.Count());
        }
    }
}