import { Test, TestingModule } from '@nestjs/testing';
import { MenuController } from './menu.controller';
import { MenuService } from './menu.service';
import { Menu } from './entities/menu.entity';

describe('MenuController', () => {
  let controller: MenuController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MenuController],
      providers: [
        {
          provide: MenuService,
          useValue: {
            findAll: jest
              .fn()
              .mockReturnValue([
                new Menu('test', 'link'),
                new Menu('test2', 'link'),
                new Menu('test3', 'link'),
              ]),
          },
        },
      ],
    }).compile();

    controller = module.get<MenuController>(MenuController);
  });

  describe('get all menu items', () => {
    it('should return a list of menu items', async () => {
      const result = await controller.findAll();
      expect(typeof result).toBe('object');
      expect(result[0].title).toBe('test');
      expect(result[0].link).toBe('link');
      expect(result.length).toBe(3);
    });
  });
});
