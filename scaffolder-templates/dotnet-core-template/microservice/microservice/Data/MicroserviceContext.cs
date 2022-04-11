namespace microservice.Data;

using Microsoft.EntityFrameworkCore;
using microservice.Entity;

public class MicroserviceContext : DbContext {
    public MicroserviceContext(DbContextOptions<MicroserviceContext> options) : base(options) {

    }

    public virtual DbSet<User> Users { get; set; }
}