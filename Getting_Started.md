# Welcome to CassiaDB

CassiaDB is a database designed just for LiveCode developers. Canela uses this database for all of our app development. We have found it to be a big time saver for us. For this reason, we want to make it available for free to the LiveCode community.

CassiaDB is compatible with the same platforms LiveCode supports. Thus, you can develop on the following desktop operating systems: Macintosh, Windows and Linux. You can deploy standalones with CassiaDB on both desktops and mobile devices with complete feature parity.

These are the steps to setting up your CassiaDB SDK (cSDK). Working with the cSDK requires a commercial edition of LiveCode. LiveCode needs to be running at all times when interacting with the cSDK.

<p><li>Start your commercial edition of LiveCode</li>
<li>Make a new stack and paste the following code into the card script of card 1 of your new stack. This code initializes the cSDK at the start up of this stack.</li></p>

<ul>
<div><pre class="line-numbers"><code class="language-none">    on preOpenStack
         initializeLiveCloud
    end preOpenStack

    command initializeLiveCloud
        global gCDBauthKey
        local tLibraryPath

        wait 0 milliseconds with messages ## GIVE THE ENGINE A CHANCE TO SPIN UP
        put &quot;TempAuth&quot; into gCDBAuthKey ##TEMPORARY AUTHKEY
        set the itemDel to &quot;/&quot;
        put item 1 to -2 of (the fileName of this stack) into tLibraryPath
        put &quot;/cassiaDB/libraries/CDB_Starter&quot; after tLibraryPath
        if there is not a file tLibraryPath then
            answer &quot;There is a problem accessing your CassiaDB libraries. Please refer to the Getting Started document.&quot;
        else
            start using stack tLibraryPath
            cdb_SetLogMode &quot;message box&quot; ##OPTIONAL
        end if
    end initializeLiveCloud</code></pre></div></li>
</ul>

<p>
<li>Save and Quit your stack.Place the cassiaDB folder next to your mainstack.</li>
<li>Start your stack. Your SDK should now have access to a number of libraries for this stack.</li>
<li>Open your message box and click on the 'Stacks in Use' icon to see the libraries. The provided gCDBauthKey in the code above is temporary. We will get our own gCDBauthKey later in this guide.</li>
</p>

<h6 id="toc_1">Your cSDK is ready for configuration. We will start by creating our first table and keys.</h6>

<ul>
<li>Open your message box and type the following to create your first table: cdb_createTable &quot;customers&quot;</li>
</ul>
