import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
import 'newrelic';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config = new DocumentBuilder()
    .setTitle('Consigmais ${{ values.component_id }}')
    .setDescription('${{ values.description }}')
    .setVersion('1.0')
    .addTag('consigmais')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  
  SwaggerModule.setup('swagger', app, document);
  
  await app.listen(3000);
}
bootstrap();
