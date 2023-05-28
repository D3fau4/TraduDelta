using Spectre.Console.Cli;
using TraduDelta.CLI.Commands;

var app = new CommandApp();

app.Configure(config =>
{
    config.SetApplicationName("TraduDelta");
    config.SetApplicationVersion("0.0.1");
#if DEBUG
    config.PropagateExceptions();
    config.ValidateExamples();
#endif
    config.AddExample("mergepo");
    config.AddCommand<MergePo>("mergepo")
        .WithDescription("Merge all po to one.");

    config.AddCommand<ApplyMods>("apply")
        .WithDescription("Aplica los mods para la traducción");
});

return app.Run(args);

/*
cmdutils.print("Welcome to TraduDelta by D3fau4!", ConsoleColor.Magenta);

var arguments = new HandlerArgs(args);

if (arguments.OperationMode is null || arguments.OperationMode == HandlerArgs.Mode.Help)
{
    HandlerArgs.PrintInfo();
    return;
}

switch (arguments.OperationMode)
{
    case HandlerArgs.Mode.ApplyMods:
        break;
    case HandlerArgs.Mode.Json2Po:
        break;
    case HandlerArgs.Mode.MergePo:
    {
        var helper = new PoMergeTranslation();
        helper.Process(arguments.poOld, arguments.poNew);
        break;
    }
    case HandlerArgs.Mode.ExtractText:
    {
        var helper = new Gamewin2Po();
        helper.Process(arguments.GameWinPath, arguments.ch1TextPath, arguments.ch2jpTextPath);
        break;
    }
}*/