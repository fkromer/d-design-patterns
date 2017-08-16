#!/usr/bin/env rdmd

import std.stdio : writeln, writefln;

// Complex parts
class CPU
{
    void freeze()
    {
        writeln("CPU: freeze");
    }

    void jump(int position)
    {
        writefln("CPU: jump to %d", position);
    }

    void execute()
    {
        writeln("CPU: execute");
    }
}

class Memory
{
    void load(int position, string data)
    {
        writefln("Memory: load %s at %d", data, position);
    }
}

class HardDrive
{
    string read(int lba, int size)
    {
        writefln("HardDrive: read sector %d (%d bytes)", lba, size);
        return "hdd data";
    }
}

// Facade
class Computer
{
    enum BOOT_ADDRESS = 0;
    enum BOOT_SECTOR = 0;
    enum SECTOR_SIZE = 512;

    private
    {
        CPU cpu;
        Memory memory;
        HardDrive hard_drive;
    }

    this()
    {
        cpu = new CPU;
        memory = new Memory;
        hard_drive = new HardDrive;
    }

    void start_computer()
    {
        cpu.freeze;
        memory.load(BOOT_ADDRESS, hard_drive.read(BOOT_SECTOR, SECTOR_SIZE));
        cpu.jump(BOOT_ADDRESS);
        cpu.execute;
    }
}

// Client
void main()
{
    auto facade = new Computer;
    facade.start_computer;
}
